return {
  {
    dir = vim.fn.stdpath 'config' .. '/lua/custom/plugins',
    name = 'overrides',
    priority = -1000,
    lazy = false,
    init = function()
      vim.g.have_nerd_font = true
      vim.o.relativenumber = true
      vim.o.undofile = false
    end,
  },
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
}

-- vim: ts=2 sts=2 sw=2 et
