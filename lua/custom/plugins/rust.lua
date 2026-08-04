vim.pack.add { 'https://github.com/mrcjkb/rustaceanvim' }
vim.pack.add { 'https://github.com/saecki/crates.nvim' }
require('crates').setup {
  lsp = { enabled = true, actions = true, completion = true, hover = true },
}
vim.g.rustaceanvim = {
  server = {
    default_settings = {
      ['rust-analyzer'] = {
        check = { command = 'clippy' },
        cargo = { allFeatures = true },
      },
    },
  },
}
-- vim: sts=2 ts=2 sw=2 et
