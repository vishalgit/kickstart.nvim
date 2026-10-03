
-- This is used to navigate seamlessly in neovim and tmux
vim.pack.add {
  { src = 'https://github.com/alexghergh/nvim-tmux-navigation' },
}

vim.keymap.set('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', { desc = 'Neovim Navigate Left', silent = true })
vim.keymap.set('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', { desc = 'Neovim Navigate Down', silent = true })
vim.keymap.set('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', { desc = 'Neovim Navigate Up', silent = true })
vim.keymap.set('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', { desc = 'Neovim Navigate Right', silent = true })
require('nvim-tmux-navigation').setup {}
-- This package will need tmux to be configured properly and tpm installed
