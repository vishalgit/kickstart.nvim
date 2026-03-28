return {
  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom/plugins',
    name = 'overrides',
    priority = -1000,
    lazy = false,
    init = function()
      vim.o.relativenumber = true
      vim.o.undofile = false
      vim.o.guifont = 'JetBrainsMono Nerd Font:h12'
      vim.g.clipboard = {
        name = 'OSC 52',
        copy = {
          ['+'] = require('vim.ui.clipboard.osc52').copy '+',
          ['*'] = require('vim.ui.clipboard.osc52').copy '*',
        },
        paste = {
          ['+'] = require('vim.ui.clipboard.osc52').paste '+',
          ['*'] = require('vim.ui.clipboard.osc52').paste '*',
        },
      }
    end,
    config = function()
      local group = vim.api.nvim_create_augroup('TextFileTypeSettings', { clear = true })

      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        pattern = { 'text' },
        callback = function()
          local opt = vim.opt_local
          opt.expandtab = true
          opt.tabstop = 4
          opt.shiftwidth = 4
          opt.softtabstop = 4
        end,
      })
    end,
  },
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
}

-- vim: ts=2 sts=2 sw=2 et
