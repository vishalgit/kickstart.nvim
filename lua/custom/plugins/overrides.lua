-- Override the global options and keymaps
return {
  {
    -- This is a dummy local plugin
    dir = vim.fn.stdpath 'config' .. '/lua/custom/plugins',
    name = 'overrides',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
      vim.keymap.set('v', 'jk', '<Esc>', { desc = 'Exit insert mode' })
      -- Override options
      vim.g.have_nerd_font = true
      vim.opt.relativenumber = true
      vim.opt.undofile = false
    end,
  },
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
}
