return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
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
          n = {
            ["<esc>"] = actions.close,
            ["q"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["l"] = actions.select_default,
            ["h"] = actions.select_horizontal,
            ["s"] = actions.select_vertical,
          },
        },
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("projects")
    telescope.load_extension("bookmarks")
    -- keymaps
    local keymap = vim.keymap.set -- for conciseness

    -- files
    keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap("n", "ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap("n", "sr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    -- nvim build in
    keymap("n", "sh", "<cmd>Telescope help_tags<cr>", { desc = "Search Help" })
    keymap("n", "sc", "<cmd>Telescope commands<cr>", { desc = "Search Commands" })
    keymap("n", "sk", "<cmd>Telescope keymaps<cr>", { desc = "Search Keymaps" })
    -- git
    keymap("n", "sC", "<cmd>Telescope git_commits<cr>", { desc = "Search Commits" })
    keymap("n", "gs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
    -- project
    keymap("n", "sp", "<cmd>Telescope projects theme=dropdown<cr>", { desc = "Find Projects" })
    -- colorscheme
    keymap("n", "sc", "<cmd>Telescope colorscheme theme=dropdown<cr>", { desc = "Search Colorschemes" })
    -- string
    keymap("n", "F", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap({ "n", "x", "v" }, "fs", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    -- buffers
    keymap("n", "fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
    -- todo
    keymap("n", "ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
  end,
}
