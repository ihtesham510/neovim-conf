return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    {
      "echasnovski/mini.indentscope",
      version = false, -- wait till new 0.7.0 release to put it back on semver
      event = "VeryLazy",
      opts = {
        -- symbol = "",
        symbol = "│",
        options = { try_as_border = true },
      },
    },
  },
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "┊" },
    scope = { enabled = false },
  },
}
