vim.pack.add { 'https://github.com/mrcjkb/rustaceanvim' }
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
-- vim: ts=2 sts=2 sw=2 et
