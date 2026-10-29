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

vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('OrgSync', { clear = true }),
  pattern = '*.org',
  callback = function()
    if vim.fn.executable 'rclone' == 0 then
      vim.notify('orgsync: rclone is not installed', vim.log.levels.WARN)
      return
    end

    local stderr = {}
    local ok, job = pcall(vim.fn.jobstart, { 'rclone', 'sync', vim.fn.expand '~/org', 'mega:org' }, {
      stderr_buffered = true,
      on_stderr = function(_, data)
        stderr = data
      end,
      on_exit = function(_, code)
        if code ~= 0 then
          local msg = vim.trim(table.concat(stderr, '\n'))
          vim.schedule(function()
            vim.notify('orgsync failed (exit ' .. code .. ')' .. (msg ~= '' and (': ' .. msg) or ''), vim.log.levels.WARN)
          end)
        end
      end,
    })

    if not ok or job <= 0 then
      vim.notify('orgsync: could not start rclone (permission denied?)', vim.log.levels.WARN)
    end
  end,
})
