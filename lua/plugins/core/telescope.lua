return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"ahmedkhalf/project.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local project = require("project_nvim")

			telescope.setup({
				defaults = {
					winblend = 0,
					border = {},
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
					initial_mode = "normal",
					file_ignore_patterns = { "node%_modules/.*", "target/*", ".git/*" },
					prompt_prefix = "     ",
					selection_caret = " ❯ ",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 60,
					},
					path_display = { "truncate" },

					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,

							["<C-c>"] = actions.close,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,

							["<CR>"] = actions.select_default,
							["<C-h>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,

							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,

							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
						},

						n = {
							["<esc>"] = actions.close,
							["q"] = actions.close,
							["<CR>"] = actions.select_default,
							["l"] = actions.select_default,
							["h"] = actions.select_horizontal,
							["s"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,

							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,

							["?"] = actions.which_key,
						},
					},
				},
				pickers = {
					-- Default configuration for builtin pickers goes here:
					-- picker_name = {
					--   picker_config_key = value,
					--   ...
					-- }
					-- Now the picker_config_key will be applied every time you call this
					-- builtin picker
					colorscheme = {
						theme = "dropdown",
						enable_preview = true,
					},
				},
				extensions = {
					-- Your extension configuration goes here:
					-- extension_name = {
					--   extension_config_key = value,
					-- }
					-- please take a look at the readme of the extension you want to configure
				},
				telescope.load_extension("file_browser"),
				telescope.load_extension("projects"),
			})
			project.setup({
				---@usage set to false to disable project.nvim.
				--- This is on by default since it's currently the expected behavior.
				active = true,

				on_config_done = nil,

				---@usage set to true to disable setting the current-woriking directory
				--- Manual mode doesn't automatically change your root directory, so you have
				--- the option to manually do so using `:ProjectRoot` command.
				manual_mode = false,

				---@usage Methods of detecting the root directory
				--- Allowed values: **"lsp"** uses the native neovim lsp
				--- **"pattern"** uses vim-rooter like glob pattern matching. Here
				--- order matters: if one is not detected, the other is used as fallback. You
				--- can also delete or rearangne the detection methods.
				-- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
				detection_methods = { "pattern" },

				---@usage patterns used to detect root dir, when **"pattern"** is in detection_methods
				patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "cargo.toml" },

				---@ Show hidden files in telescope when searching for files in a project
				show_hidden = true,

				---@usage When set to false, you will get a message when project.nvim changes your directory.
				-- When set to false, you will get a message when project.nvim changes your directory.
				silent_chdir = true,

				---@usage list of lsp client names to ignore when using **lsp** detection. eg: { "efm", ... }
				ignore_lsp = {},

				---@type string
				---@usage path to store the project history for use in telescope
				datapath = vim.fn.stdpath("data"),
			})
		end,
		keys = {
			{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
			{ "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
			-- search
			{ "sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
			{ "sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
			{ "sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
			{ "sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
			{ "sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
			{ "sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
			{ "sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "sp", "<cmd>Telescope projects theme=dropdown<cr>", desc = "Projects" },
			{ "ss", "<cmd>Telescope file_browser theme=ivy<cr>", desc = "file browser" },
			{ "sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "sH", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },
			-- Find
			{ "ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "F", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
			{ "fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
