-- ~/.config/kickstart/lua/custom/plugins/neovide.lua

return {
  {
    dir = '.',
    name = 'neovide-config',
    lazy = false,
    cond = vim.g.neovide, -- only load in neovide
    init = function()
      vim.g.neovide_cursor_animation_length = 0
      vim.g.neovide_cursor_trail_size = 0
      vim.g.neovide_scroll_animation_length = 0
      vim.g.neovide_position_animation_length = 0
      vim.g.neovide_cursor_animate_command_line = false
      vim.g.neovide_cursor_animate_in_insert_mode = false
    end,
  },
}
