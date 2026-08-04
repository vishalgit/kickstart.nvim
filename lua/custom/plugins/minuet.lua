vim.pack.add {"https://github.com/milanglacier/minuet-ai.nvim"}

require('minuet').setup {
  provider = 'openai_fim_compatible',
  request_timeout = 4,
  throttle = 1000,
  debounce = 400,
  n_completions = 1,
  context_window = 2048,
  provider_options = {
    openai_fim_compatible = {
      name = 'LM Studio',
      -- NOTE: FIM uses the legacy completions endpoint, not chat/completions
      end_point = 'http://localhost:1234/v1/completions',
      api_key = function() return 'lm-studio' end, -- any non-empty value works
      model = 'qwen3-coder-30b-a3b-instruct',  -- BASE model id, see warning below
      stream = true,
      optional = {
        max_tokens = 128000,
        top_p = 0.9,
      },
    },
  },
  -- blink.cmp handles display; keep virtual text off to avoid double UI
  virtualtext = {
    auto_trigger_ft = {},
  },
}


-- vim: ts=2 sts=2 sw=2 et
