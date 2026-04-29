return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim',
    'roobert/tailwindcss-colorizer-cmp.nvim',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local tailwind_formatter = require('tailwindcss-colorizer-cmp').formatter
    local lspkind = require 'lspkind'

    lspkind.init {
      symbol_map = {
        Text = '󰉿',
        Method = '󰆧',
        Function = '',
        Constructor = '',
        Field = '󰜢',
        Variable = ' ',
        Class = '󰠱',
        Interface = '',
        Module = '',
        Property = '󰜢',
        Unit = '󰑭',
        Value = '󰎠',
        Enum = '',
        Keyword = '󰌋',
        Snippet = '󰄱',
        Color = '󰏘',
        File = '󰈙',
        Reference = '󰈇',
        Folder = '󰉋',
        EnumMember = '',
        Constant = '󰏿',
        Struct = '',
        Event = '',
        Operator = '󰆕',
        TypeParameter = '',
      },
    }

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup {
      completion = {
        -- removed 'preview' — it was interfering with border rendering
        completeopt = 'menu,menuone,noselect',
      },

      -- explicit border config instead of cmp.config.window.bordered()
      -- this prevents plugins from silently overriding winhighlight
      window = {
        completion = {
          border = 'rounded',
          winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
          scrollbar = false,
        },
        documentation = {
          border = 'rounded',
          winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
        },
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = {
        ['<A-k>'] = cmp.mapping.select_prev_item(),
        ['<A-j>'] = cmp.mapping.select_next_item(),
        ['<C-h>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
        ['<C-l>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<M-.>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-j>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<M-,>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-k>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },

      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'crates' },
      },

      -- lspkind runs first, tailwind colorizer runs second
      -- order matters: lspkind sets the icon, tailwind overrides color items
      formatting = {
        format = function(entry, vim_item)
          vim_item = lspkind.cmp_format {
            maxwidth = 50,
            ellipsis_char = '...',
          }(entry, vim_item)

          vim_item = tailwind_formatter(entry, vim_item)

          return vim_item
        end,
      },
    }
  end,
}
