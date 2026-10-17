vim.g.unception_block_while_host_edits = true
vim.pack.add {
  'https://github.com/rawnly/gist.nvim',
  'https://github.com/samjwill/nvim-unception',
}

require('gist').setup {
  platform = 'github',
  clipboard = '+',
}
