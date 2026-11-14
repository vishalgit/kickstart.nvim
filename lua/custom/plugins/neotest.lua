vim.pack.add {
	-- nvim-nio (debug.lua) and plenary.nvim (init.lua) are already added earlier
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
