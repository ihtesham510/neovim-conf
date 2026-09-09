return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 1000,
          lsp_format = 'fallback',
        }
      end
    end,
    notify_no_formatters = true,
    formatters = {
      biome = {
        require_cmd = true,
      },
      prettier = {
        require_cmd = true,
      },
    },
    formatters_by_ft = {
      dockerfile = { 'dockerfmt' },
      cpp = { 'clang-format' },
      typescript = { 'prettier', 'biome', 'biome-organize-imports' },
      typescriptreact = { 'prettier', 'biome', 'biome-organize-imports' },
      javascript = { 'prettier', 'biome', 'biome-organize-imports' },
      javascriptreact = { 'prettier', 'biome', 'biome-organize-imports' },
      sql = { 'sqlfmt' },
      rust = { 'rustfmt' },
      toml = { 'taplo' },
      svelte = { 'prettierd' },
      css = { 'prettier' },
      html = { 'prettier', 'biome' },
      json = { 'prettier', 'biome' },
      yaml = { 'prettier' },
      markdown = { 'prettierd' },
      graphql = { 'prettierd' },
      liquid = { 'prettierd' },
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      go = { 'crlfmt' },
    },
  },
}
