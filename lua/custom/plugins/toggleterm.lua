-- toggleterm.lua
-- https://github.com/akinsho/toggleterm.nvim

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 15,
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      close_on_exit = true,
      direction = 'horizontal',
      shell = 'zsh',
      auto_scroll = true,
    }
  end,
}
