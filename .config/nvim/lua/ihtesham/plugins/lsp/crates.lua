return {
  'Saecki/crates.nvim',
  event = { 'BufRead Cargo.toml' },
  keys = {
    {
      '<leader>ci',
      function()
        require('crates').show_crate_popup()
      end,
      desc = 'show crates info',
    },
    {
      '<leader>cv',
      function()
        require('crates').show_versions_popup()
      end,
      desc = 'show popup version',
    },
    {
      '<leader>cf',
      function()
        require('crates').show_features_popup()
        require('crates').show_features_popup()
      end,
      desc = 'show popup version',
    },
  },
  opts = {
    completion = {
      crates = {
        enabled = true,
      },
    },
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
    },
  },
}
