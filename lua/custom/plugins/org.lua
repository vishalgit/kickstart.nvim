vim.pack.add { 'https://github.com/xheisenbugx/org.nvim' }
require('org').setup {
  org_directory = '~/org',
  agenda_files = { '~/org/**/*.org' },
  default_notes_file = '~/org/refile.org',
  agenda = {
    window = 'float',
  },
  extensions = {
    roam = { directory = '~/org/roam' },
    quickadd = true,
    journal = { directory = '~/org/journal' },
  },
}

-- Org <-> rclone (mega:org) sync.
--
-- Normal syncs are a plain `rclone bisync`, which propagates deletions and handles
-- conflicts by comparing both sides. `--resync` is only for (re)building the bisync
-- listings: it never propagates deletions and can overwrite newer remote changes with
-- the local copy, so it is NOT run on every save. Run `:OrgSyncResync` once manually
-- (or whenever bisync asks for it).
local org_local = vim.fn.expand '~/org'
local org_remote = 'mega:org'
local debounce_ms = 2000

local running = false
local pending = false
local timer = assert(vim.uv.new_timer())

---@param resync boolean
local function org_sync(resync)
  if vim.fn.executable 'rclone' == 0 then
    vim.notify('orgsync: rclone is not installed', vim.log.levels.WARN)
    return
  end

  -- Only one rclone bisync at a time; queue one more run if saves happen meanwhile
  if running then
    pending = true
    return
  end

  local cmd = { 'rclone', 'bisync', '--ask-password=false', org_local, org_remote, '--size-only' }
  if resync then table.insert(cmd, '--resync') end

  local stderr = {}
  running = true
  local ok, job = pcall(vim.fn.jobstart, cmd, {
    stdin = 'null',
    stderr_buffered = true,
    on_stderr = function(_, data) stderr = data end,
    on_exit = function(_, code)
      vim.schedule(function()
        running = false
        if code ~= 0 then
          local msg = vim.trim(table.concat(stderr, '\n'))
          if msg:find('--resync', 1, true) then msg = msg .. '\n(run :OrgSyncResync once to initialise bisync)' end
          vim.notify('orgsync failed (exit ' .. code .. ')' .. (msg ~= '' and (': ' .. msg) or ''), vim.log.levels.WARN)
        else
          vim.notify('orgsync: synced ' .. org_local .. ' with ' .. org_remote, vim.log.levels.INFO)
        end
        if pending then
          pending = false
          org_sync(false)
        end
      end)
    end,
  })

  if not ok or job <= 0 then
    running = false
    vim.notify('orgsync: could not start rclone (permission denied?)', vim.log.levels.WARN)
  end
end

vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('OrgSync', { clear = true }),
  pattern = '*.org',
  callback = function()
    -- Debounce bursts of saves into a single sync
    timer:stop()
    timer:start(debounce_ms, 0, vim.schedule_wrap(function() org_sync(false) end))
  end,
})

vim.api.nvim_create_user_command('OrgSyncResync', function() org_sync(true) end, {
  desc = 'Initialise/repair rclone bisync for ~/org (runs with --resync)',
})
