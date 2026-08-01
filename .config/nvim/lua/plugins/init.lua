return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        progress = { enabled = true }, -- ✅ show LSP progress
        hover = { enabled = true }, -- ❌ disable LSP hover
        signature = { enabled = true }, -- ❌ disable LSP signature help
        message = { enabled = false }, -- ❌ disable LSP messages
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = false,
        inc_rename = true,
        lsp_doc_border = true,
      },
      -- disable all other routes/views
      messages = { enabled = false },
      cmdline = { enabled = true },
      popupmenu = { enabled = true },
      notify = { enabled = false },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    },
  },
  { -- Collection of various small independent plugins/modules
    "nvim-mini/mini.nvim",
    event = "VeryLazy",
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = [[<A-f>]],
      persist_size = true,
      direction = "float",
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
  },
}
