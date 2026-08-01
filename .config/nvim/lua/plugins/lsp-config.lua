return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          -- Add or change a keymap
          { "K", vim.lsp.buf.hover, desc = "Hover" },
          -- Capability-based keymap (only set if server supports it)
          { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", has = "codeAction" },
          { "ca", vim.lsp.buf.code_action, desc = "Code Action", has = "codeAction" },
          { "<leader>d", vim.diagnostic.open_float, desc = "Open Diagnostics Dialog" },
        },
      },
    },
  },
}
