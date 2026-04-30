return {
  'nvim-lua/plenary.nvim', -- lua functions that many plugins use
  'christoomey/vim-tmux-navigator', -- tmux & split window navigation
  { 'NMAC427/guess-indent.nvim', event = 'BufEnter' },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    evnet = 'VeryLazy',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
  },
  {
    'akinsho/toggleterm.nvim',
    opts = {
      open_mapping = [[<A-f>]],
      persist_size = true,
      direction = 'float',
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    dependencies = {
      {
        'echasnovski/mini.indentscope',
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = 'VeryLazy',
        opts = {
          -- symbol = "",
          symbol = '│',
          options = { try_as_border = true },
        },
      },
    },
    event = { 'BufReadPre', 'BufNewFile' },
    main = 'ibl',
    opts = {
      indent = { char = '┊' },
      scope = { enabled = false },
    },
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = true } },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
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
}
