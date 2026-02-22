return {
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-orgmode/telescope-orgmode.nvim',
      'nvim-orgmode/org-bullets.nvim',
      'saghen/blink.cmp',
    },
    event = 'VeryLazy',
    config = function()
      require('orgmode').setup {
        org_agenda_files = '~/org/**/*',
        org_default_notes_file = '~/org/notes.org',
      }
      require('telescope').load_extension 'orgmode'
      require('org-bullets').setup()
      vim.lsp.enable 'org'
      -- Keybindings
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'org',
        group = vim.api.nvim_create_augroup('orgmode_config', { clear = true }),
        callback = function()
          local buf = vim.api.nvim_get_current_buf()
          -- Telescope refile much better
          vim.keymap.set('n', '<leader>or', require('telescope').extensions.orgmode.refile_heading, { buffer = buf, desc = 'Org: Refile' })
        end,
      })
    end,
  },
}
