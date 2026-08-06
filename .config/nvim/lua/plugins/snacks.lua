return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      enabled = true,
    },
    picker = {
      sources = {
        explorer = {
          auto_close = true, -- close the explorer after opening a file
          hidden = true,
          ignored = true,
          exclude = {
            "**/.git/*",
            "**/node_modules/*",
          },
        },
      },
    },
  },
}
