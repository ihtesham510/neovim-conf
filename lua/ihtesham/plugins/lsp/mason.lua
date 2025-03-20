return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- keymap
    local keymap = vim.keymap.set -- for conciseness
    local opts = { noremap = true, silent = true }
    opts.desc = "Open Mason"
    keymap("n", "<leader>m", "<cmd>Mason<cr>", opts)
    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- "tsserver",
        "docker_compose_language_service",
        "dockerls",
        "vtsls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "jsonls",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        -- "clangd",
        "taplo",
        -- "sqlls",
        "rust_analyzer",
        -- "gopls",
        -- "pyright",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "sql-formatter",
        -- "clang-format",
        -- "crlfmt",
        -- "isort", -- python formatter
        -- "black", -- python formatter
        -- "pylint",
        "eslint_d",
      },
    })
  end,
}
