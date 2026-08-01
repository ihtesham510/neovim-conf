return {
  "hrsh7th/nvim-cmp",
  opts = {
    window = {
      completion = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        scrollbar = false,
      },
      documentation = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      },
    },
    mapping = require("cmp").mapping.preset.insert({
      ["<A-,>"] = require("cmp").mapping.select_prev_item(),
      ["<A-.>"] = require("cmp").mapping.select_next_item(),
      ["<C-h>"] = require("cmp").mapping(require("cmp").mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-l>"] = require("cmp").mapping(require("cmp").mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = require("cmp").mapping(require("cmp").mapping.complete(), { "i", "c" }),
      ["<C-y>"] = require("cmp").config.disable,
      ["<C-e>"] = require("cmp").mapping({
        i = require("cmp").mapping.abort(),
        c = require("cmp").mapping.close(),
      }),
      ["<CR>"] = require("cmp").mapping.confirm({ select = true }),
    }),
  },
}
