vim.pack.add { 'https://github.com/seblyng/roslyn.nvim' }
require('roslyn').setup {
	broad_search = true,
	lock_target = false,
}
vim.lsp.config('roslyn', {
	settings = {
		['csharp|background_analysis'] = {
			dotnet_analyzer_diagnostics_scope = 'fullSolution',
			dotnet_compiler_diagnostics_scope = 'fullSolution',
		},
	},
})
