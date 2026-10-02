-- ============================================================
-- claudecode.nvim — vim.pack.add native
-- ============================================================

-- Plugin + dependency. vim.pack.add loads at startup, so the real
-- :ClaudeCode* commands register right away — no stub machinery
-- needed to make them exist on a fresh start.
vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },          -- dependency first
  { src = "https://github.com/coder/claudecode.nvim", name = "claudecode" },
})

-- config = true  ->  call setup() yourself
require("claudecode").setup()

-- ------------------------------------------------------------
-- Keymaps (lazy's `keys = { ... }`)
-- ------------------------------------------------------------
local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Group label. With which-key, prefer:
--   require("which-key").add({ { "<leader>a", group = "AI/Claude Code" } })
map("n", "<leader>a", "<Nop>", "AI/Claude Code")

map("n", "<leader>ac", "<cmd>ClaudeCode<cr>",            "Toggle Claude")
map("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       "Focus Claude")
map("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   "Resume Claude")
map("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", "Continue Claude")
map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", "Select Claude model")
map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       "Add current buffer")
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>",        "Send to Claude")

-- Diff management
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>",  "Accept diff")
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",    "Deny diff")

-- ------------------------------------------------------------
-- Filetype-scoped mapping (lazy's `ft = { ... }` on a key spec).
-- vim.keymap.set has no `ft` option, so set a buffer-local map
-- via a FileType autocmd. This <leader>as shadows the visual-mode
-- Send only inside tree buffers, matching lazy's behaviour.
-- ------------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  group   = vim.api.nvim_create_augroup("ClaudeCodeTreeKeys", { clear = true }),
  pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
  callback = function(ev)
    vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", {
      buffer = ev.buf,
      silent = true,
      desc   = "Add file (tree)",
    })
  end,
})
