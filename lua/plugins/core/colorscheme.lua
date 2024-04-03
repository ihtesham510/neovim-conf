return {
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
	},
	{
		"folke/tokyonight.nvim",
		-- lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd([[colorscheme tokyonight-night]])
		-- 	vim.o.background = "dark"
		-- end,
	},
	{
		"Everblush/nvim",
		-- lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd("colorscheme everblush")
		-- 	vim.o.background = "dark"
		-- end,
	},
	{
		"LunarVim/onedarker.nvim",
		-- lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd("colorscheme onedarker")
		-- end,
	},
	{
		"dasupradyumna/midnight.nvim",
		-- lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd("colorscheme midnight")
		-- end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
}
