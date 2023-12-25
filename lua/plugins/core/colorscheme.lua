return {
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		config = function()
			vim.cmd([[colorscheme vscode]])
			vim.o.background = "dark"
		end,
	},
}
