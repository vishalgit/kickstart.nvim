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
      require('org-bullets').setup()
      vim.lsp.enable 'org'
    end,
  },
}
