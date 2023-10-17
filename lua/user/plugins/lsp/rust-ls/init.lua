local on_attach = require("user.plugins.lsp.lspconfig").on_attach
local capabilities = require("user.plugins.lsp.lspconfig").capabilities
local rust_tools_options = {
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
}
local plugins = {
	{
		"simrat39/rust-tools.nvim",
		dependencies = "neovim/nvim-lspconfig",
		ft = "rust",
		opts = function()
			return rust_tools_options
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.setup({
				src = {
					cmp = {
						enabled = true,
					},
				},
			})
			crates.show()
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
}
return plugins
