vim.pack.add({
	"https://github.com/tpope/vim-dadbod",
	"https://github.com/tpope/vim-dotenv",
	"https://github.com/kristijanhusak/vim-dadbod-ui",
	"https://github.com/kristijanhusak/vim-dadbod-completion",
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.filereadable(".env") == 1 then
			vim.cmd("silent! Dotenv .env")
		end
	end,
})

-- vim-dadbod-ui
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
vim.g.dbs = {
	{ name = "todo_dev", url = "postgres://todo:todo@localhost:5432/todo_dev" },
}

local map = vim.keymap.set
map('n', '<leader>Du', '<cmd>DBUIToggle<cr>', { desc = 'DB: toggle UI' })
map('n', '<leader>Dq', '<cmd>.DB<cr>', { desc = 'DB: run current line' })
map('x', '<leader>Dq', '<cmd>:DB<cr>', { desc = 'DB: run selection' })
