vim.pack.add {"https://github.com/milanglacier/minuet-ai.nvim"}

require('minuet').setup {
  provider = 'openai_fim_compatible',
  provider_options = {
    openai_fim_compatible = {
      api_key = 'DEEPSEEK_API_KEY',
      name = 'deepseek',
      optional = {
        max_tokens = 256,
        top_p = 0.9,
      },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
