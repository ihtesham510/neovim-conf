return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile" },
  keys = {
    {"gj","<cmd>lua require 'gitsigns'.next_hunk()<cr>",desc = "Git Next Hunk"},
    {"gk","<cmd>lua require 'gitsigns'.prev_hunk()<cr>",desc = "Git Previous Hunk"},
    {"gB","<cmd>lua require 'gitsigns'.blame_line()<cr>",desc = "Git Blame"},
    {"gr","<cmd>lua require 'gitsigns'.reset_hunk()<cr>",desc = "Git Reset Hunk"},
    {"gR","<cmd>lua require 'gitsigns'.reset_buffer()<cr>",desc = "Git Reset buffer"},
    {"gs","<cmd>lua require 'gitsigns'.stage_hunk()<cr>",desc = "Git stage hunk"},
    {"gu","<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",desc = "git undostage hunk"},
    {"gS","<cmd>Telescope git_status<cr>",desc = "Git Status"},
    { "gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
  },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "" },
				change = { text = "" },
				delete = { text = "" },
				topdelete = { text = "󱅁" },
				changedelete = { text = "󰍷" },
				untracked = { text = "" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			yadm = {
				enable = false,
			},
		})
	end,
}
