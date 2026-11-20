vim.pack.add({
  "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
})

require("tiny-inline-diagnostic").setup({
  preset = "modern",
})

vim.diagnostic.config({
  virtual_text = false, -- disable the default virtual text
})
