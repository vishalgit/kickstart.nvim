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
      win_split_mode = 'float',
      org_capture_templates = {
        ------------------------------------------------------------------
        -- P.A.R.A. – PROJECTS (short-term, outcome-driven)
        ------------------------------------------------------------------
        p = {
          description = 'PARA – New project',
          template = '* PROJECT %^{Project name} :project:\n'
            .. '  CREATED: %U\n'
            .. '  OUTCOME: %^{Desired outcome}\n'
            .. '  DUE: %^T\n\n'
            .. '  * Next actions\n'
            .. '  - [ ] %?\n',
          target = '~/notes/para-projects.org',
        },
        a = {
          description = 'PARA – Project task',
          template = '* TODO %^{Action} :project:\n' .. '  CREATED: %U\n' .. '  PROJECT: %^{Project link or name}\n' .. '  %a\n',
          target = '~/notes/para-projects.org',
        },

        ------------------------------------------------------------------
        -- P.A.R.A. – AREAS (ongoing responsibilities)
        ------------------------------------------------------------------
        A = {
          description = 'PARA – New area',
          template = '* AREA %^{Area name} :area:\n'
            .. '  CREATED: %U\n'
            .. '  STANDARD: %^{What does “good” look like?}\n\n'
            .. '  * On-going responsibilities\n'
            .. '  - [ ] %?\n',
          target = '~/notes/para-areas.org',
        },
        x = {
          description = 'PARA – Area task',
          template = '* TODO %^{Action} :area:\n' .. '  CREATED: %U\n' .. '  AREA: %^{Area link or name}\n' .. '  %a\n',
          target = '~/notes/para-areas.org',
        },

        ------------------------------------------------------------------
        -- P.A.R.A. – RESOURCES (interesting, useful reference)
        ------------------------------------------------------------------
        r = {
          description = 'PARA – Resource note',
          template = '* %^{Title} :resource:\n' .. '  CREATED: %U\n' .. '  SOURCE: %a\n' .. '  TOPIC: %^{Topic/tag}\n\n' .. '  %?',
          target = '~/notes/para-resources.org',
        },

        ------------------------------------------------------------------
        -- P.A.R.A. – ARCHIVES (inactive projects/areas/resources)
        ------------------------------------------------------------------
        R = {
          description = 'PARA – Archive item',
          template = '* ARCHIVED %^{Title} :archive:\n' .. '  ARCHIVED: %U\n' .. '  FROM: %^{From (Project/Area/Resource)}\n\n' .. '  %?',
          target = '~/notes/para-archives.org',
        },

        ------------------------------------------------------------------
        -- BASB-style quick capture (inbox → later classify to P.A.R.A.)
        ------------------------------------------------------------------
        i = {
          description = 'Inbox (Second Brain capture)',
          template = '* %^{Quick capture} :inbox:\n' .. '  CAPTURED: %U\n' .. '  SOURCE: %a\n\n' .. '  NOTES:\n' .. '  %?',
          target = '~/notes/inbox.org',
        },

        ------------------------------------------------------------------
        -- Meetings and journal, aligned with PARA
        ------------------------------------------------------------------
        m = {
          description = 'Meeting (linked to Project/Area)',
          template = '* %^{Title} :meeting:\n'
            .. '  WHEN: %^T\n'
            .. '  CONTEXT: %^{Project/Area}\n'
            .. '  ATTENDEES: %^{Attendees}\n'
            .. '  CREATED: %U\n'
            .. '  %a\n\n'
            .. '  * Highlights (distilled)\n'
            .. '  - %?\n\n'
            .. '  * Action items\n'
            .. '  - [ ] \n',
          target = '~/notes/meetings.org',
        },
        j = {
          description = 'Daily note (journal – CODE capture/organize)',
          template = '* %<%H:%M> %^{Headline}\n' .. '  %U\n' .. '  AREA/PROJECT: %^{Related Area/Project|None}\n\n' .. '  - %?',
          target = '~/notes/journal.org',
          datetree = true,
        },
      },
    }
  end,
}
