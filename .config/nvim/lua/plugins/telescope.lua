return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- add a keymap to browse plugin files
    {
      "<leader>sh",
      function()
        require("telescope.builtin").help_tags({})
      end,
      desc = "Find Help Tags",
    },
    {
      "<leader>sk",
      function()
        require("telescope.builtin").keymaps({})
      end,
      desc = "Find keymaps",
    },
    {
      "ff",
      function()
        require("telescope.builtin").find_files({})
      end,
      desc = "Find Files",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files({})
      end,
      desc = "Find Files",
    },
    {
      "<leader>sd",
      function()
        require("telescope.builtin").diagnostics({})
      end,
      desc = "Find Files",
    },
    {
      "sd",
      function()
        require("telescope.builtin").diagnostics({})
      end,
      desc = "Find Files",
    },
    {
      "<leader>sr",
      function()
        require("telescope.builtin").oldfiles({})
      end,
      desc = "Find Files",
    },
    {
      "sr",
      function()
        require("telescope.builtin").oldfiles({})
      end,
      desc = "Find Files",
    },
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").buffers({})
      end,
      desc = "Find Files",
    },
    {
      "<leader>ss",
      function()
        require("telescope.builtin").builtin({})
      end,
      desc = "Telescope Builtin",
    },
    {
      "ss",
      function()
        require("telescope.builtin").builtin({})
      end,
      desc = "Telescope Builtin",
    },
    {
      "F",
      function()
        require("telescope.builtin").live_grep({})
      end,
      desc = "Live Grep",
    },
    -- grep
    {
      "<leader>so",
      function()
        require("telescope.builtin").live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end,
      desc = "Grep Open Files",
    },
    -- git keymaps
    {
      "<leader>gf",
      function()
        require("telescope.builtin").git_files({})
      end,
      desc = "Find git File",
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status({})
      end,
      desc = "Git Status",
    },
    {
      "<leader>gS",
      function()
        require("telescope.builtin").git_stash({})
      end,
      desc = "Git Stash",
    },
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches({})
      end,
      desc = "Git Branches",
    },
    -- find config files
    {
      "<leader>sc",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Plugin File",
    },
  },
  -- change some options
  opts = {
    defaults = {
      prompt_prefix = "     ",
      selection_caret = " ❯ ",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      color_devicons = true,
      initial_mode = "normal",
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
      winblend = 0,
      mappings = {
        i = {
          ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
          ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
        },
        n = {
          ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
          ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
          ["["] = require("telescope.actions").preview_scrolling_up,
          ["]"] = require("telescope.actions").preview_scrolling_down,
          ["<esc>"] = require("telescope.actions").close,
          ["q"] = require("telescope.actions").close,
          ["<CR>"] = require("telescope.actions").select_default,
          ["l"] = require("telescope.actions").select_default,
          ["h"] = require("telescope.actions").select_horizontal,
          ["s"] = require("telescope.actions").select_vertical,
        },
      },
    },
  },
}
