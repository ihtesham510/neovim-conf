return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    {
      "t",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
  },
  opts = {
    window = {
      mappings = {
        ["l"] = "open",
        ["<space>"] = "none",
        ["t"] = "close_window",
        ["q"] = "close_window",
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
    hide_dotfiles = false,
    hide_gitignored = false,
    hide_ignored = false, -- hide files that are ignored by other gitignore-like files
    -- other gitignore-like files, in descending order of precedence.
    ignore_files = {},
    hide_hidden = false, -- only works on Windows for hidden files/directories
    hide_by_name = {
      "node_modules",
    },
    hide_by_pattern = {
      --"*.meta",
      --"*/src/*/tsconfig.json",
    },
    always_show = { -- remains visible even if other settings would normally hide it
      ".gitignore",
    },
    always_show_by_pattern = { -- uses glob style patterns
      ".env*",
      "*.json",
    },
  },
}
