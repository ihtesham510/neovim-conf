return {
	"nvim-telescope/telescope.nvim",
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
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				initial_mode = "normal",
				file_ignore_patterns = { "node%_modules/.*" },
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
					preview_cutoff = 120,
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
						["<C-x>"] = actions.select_horizontal,
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
						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
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
				planets = {
					show_pluto = true,
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
			patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

			---@ Show hidden files in telescope when searching for files in a project
			show_hidden = false,

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
}
