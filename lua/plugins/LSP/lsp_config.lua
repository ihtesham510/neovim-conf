local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()
local lspconfig = require("lspconfig")
---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
	local keymap = vim.keymap.set -- for conciseness
	local function show_documentation()
		local filetype = vim.bo.filetype
		if vim.tbl_contains({ "vim", "help" }, filetype) then
			vim.cmd("h " .. vim.fn.expand("<cword>"))
		elseif vim.tbl_contains({ "man" }, filetype) then
			vim.cmd("Man " .. vim.fn.expand("<cword>"))
		elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
			require("crates").show_popup()
		else
			vim.lsp.buf.hover()
		end
	end
	local opts = { noremap = true, silent = true }
	opts.buffer = bufnr
	-- set keybinds
	opts.desc = "Show LSP references"
	keymap("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

	opts.desc = "Go to declaration"
	keymap("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

	opts.desc = "Show LSP definitions"
	keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

	opts.desc = "Show LSP implementations"
	keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

	opts.desc = "Show LSP type definitions"
	keymap("n", "<leader>t", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

	opts.desc = "See available code actions"
	keymap({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

	opts.desc = "Smart rename"
	keymap("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

	opts.desc = "Show buffer diagnostics"
	keymap("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

	opts.desc = "Show line diagnostics"
	keymap("n", "<leader>D", vim.diagnostic.open_float, opts) -- show diagnostics for line

	opts.desc = "Go to previous diagnostic"
	keymap("n", "[", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

	opts.desc = "Go to next diagnostic"
	keymap("n", "]", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

	opts.desc = "Show documentation for what is under cursor"
	keymap("n", "K", show_documentation, opts) -- show documentation for what is under cursor

	opts.desc = "Restart LSP"
	keymap("n", "<leader>lr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

	opts.desc = "LSP info"
	keymap("n", "<leader>li", ":LspInfo<CR>", opts) -- mapping to restart lsp if necessary
end

return {
	{
		"neovim/nvim-lspconfig",
		dartls = {
			setup = {
				cmd = { "dart", "language-server", "--protocol=lsp" },
			},
		},
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"b0o/schemastore.nvim",
		},
		config = function()
			require("plugins.LSP.lang.ts")

			-- for dart_ls
			lspconfig.dartls.setup({
				cmd = { "dart", "language-server", "--protocol=lsp" },
			})

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
			local language_servers = {
				"html",
				"taplo",
				"sqlls",
				"cssls",
				"tailwindcss",
				"svelte",
				"prismals",
				"pyright",
				"clangd",
			}

			for _, server in ipairs(language_servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end
			-- configure graphql language server
			lspconfig["graphql"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
			})

			-- configure emmet language server
			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
			})
			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
			lspconfig["jsonls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
				diagnostics = true,
				setup = {
					commands = {
						Format = {
							function()
								vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
							end,
						},
					},
				},
			})
		end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function()
			---@diagnostic disable-next-line: different-requires
			require("plugins.LSP.lang.crates")
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

		"simrat39/rust-tools.nvim",
		opts = {
			server = {
				on_attach = require("plugins.LSP.lang.rust"),
				capabilities = capabilities,
			},
		},
		dependencies = "neovim/nvim-lspconfig",
		ft = "rust",
	},
}
