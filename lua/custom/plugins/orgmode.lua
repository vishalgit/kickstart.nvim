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
      org_capture_templates = {
        t = {
          description = 'Task',
          template = '- TODO %? %U',
          target = '~/notes/gtd/inbox.org',
          headline = 'Inbox',
        },
        j = {
          description = 'Journal Today',
          template = '* %^{Journal About}\n:CREATED: %U\n %?',
          target = '~/notes/journal/%<%Y-%m-%d>.org',
        },
      },
      win_split_mode = 'float',
    }
  end,
}
