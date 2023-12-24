return {
	{
		"williamboman/mason.nvim",
		event = { "BufRead", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jayp0521/mason-null-ls.nvim",
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local mason = require("mason")
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"tsserver",
					"jsonls",
					"cssls",
					"tailwindcss",
					"taplo",
					"svelte",
					"clangd",
					"prismals",
					"graphql",
					"emmet_ls",
					"pyright",
					"tailwindcss",
				},
			})
			local keymap = vim.keymap.set
			local opts = { noremap = true, silent = true }
			keymap("n", "<leader>m", "<cmd>Mason<CR>", opts) -- show definition, references
		end,
	},
}
