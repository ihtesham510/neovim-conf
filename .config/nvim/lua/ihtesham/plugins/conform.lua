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
      prettierd = {
        require_cmd = true,
      },
    },
    formatters_by_ft = {
      typescript = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      javascript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      sql = { 'sqlfmt' },
      rust = { 'rustfmt' },
      toml = { 'taplo' },
      svelte = { 'prettierd' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      json = { 'prettierd' },
      yaml = { 'prettierd' },
      markdown = { 'prettierd' },
      graphql = { 'prettierd' },
      liquid = { 'prettierd' },
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      go = { 'crlfmt' },
    },
  },
}
