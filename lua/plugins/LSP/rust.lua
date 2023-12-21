local on_attach = require("plugins.LSP.lsp_config").on_attach
local capabilities = require("plugins.LSP.lsp_config").capabilities
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
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function()
			local crates = require("crates")
			local keymap = vim.keymap.set
			crates.setup({
				src = {
					cmp = {
						enabled = true,
					},
				},
			})
			keymap("n", "<leader>lcu", "<cmd>lua require('crates').update_crate()<CR>", { desc = "Update crate" })
			keymap(
				"n",
				"<leader>lcU",
				"<cmd>lua require('crates').update_all_crates()<CR>",
				{ desc = "Update all crates" }
			)
			keymap("n", "<leader>lci", "<cmd>lua require('crates').show_popup()<CR>", { desc = "Crate Info" })
			keymap(
				"n",
				"<leader>lcd",
				"<cmd>lua require('crates').show_dependencies_popup()<CR>",
				{ desc = "Crate Dependencies" }
			)
			keymap(
				"n",
				"<leader>lcv",
				"<cmd>lua require('crates').show_versions_popup()<CR><cmd>lua require('crates').show_versions_popup()<CR>",
				{ desc = "Crate version" }
			)
			keymap(
				"n",
				"<leader>lcf",
				"<cmd>lua require('crates').show_features_popup()<CR><cmd>lua require('crates').show_features_popup()<CR>",
				{ desc = "Crate features" }
			)
		end,
	},
}
return plugins
