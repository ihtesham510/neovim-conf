return {
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-storm]])
			vim.o.background = "dark"
		end,
	},
}
