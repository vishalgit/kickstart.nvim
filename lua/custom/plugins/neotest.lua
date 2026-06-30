vim.pack.add {
	{ src = 'https://github.com/nvim-neotest/nvim-nio' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-neotest/neotest' },
	{ src = 'https://github.com/Issafalcon/neotest-dotnet' },
	{ src = "https://github.com/mrcjkb/rustaceanvim" },
}
require('neotest').setup {
	adapters = {
		require('neotest-dotnet'),
		require('rustaceanvim.neotest')
	},
}
