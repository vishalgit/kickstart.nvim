-- nvim-orgmode / orgmode
-- https://github.com/nvim-orgmode/orgmode

return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    require('orgmode').setup {
      org_agenda_files = '~/notes/**/*',
      org_default_notes_file = '~/notes/index.org',
    }
  end,
}
