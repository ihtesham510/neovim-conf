return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'
    require('telescope').setup {
      defaults = {
        color_devicons = true,
        initial_mode = 'normal',
        prompt_prefix = '     ',
        selection_caret = ' ❯ ',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 60,
        },
        mappings = {
          i = {
            ['<C-j>'] = require('telescope.actions').preview_scrolling_down,
            ['<C-k>'] = require('telescope.actions').preview_scrolling_up,
          },
          n = {
            ['<C-j>'] = require('telescope.actions').preview_scrolling_down,
            ['<C-k>'] = require('telescope.actions').preview_scrolling_up,
            ['['] = require('telescope.actions').preview_scrolling_up,
            [']'] = require('telescope.actions').preview_scrolling_down,
            ['<esc>'] = actions.close,
            ['q'] = actions.close,
            ['<CR>'] = actions.select_default,
            ['l'] = actions.select_default,
            ['h'] = actions.select_horizontal,
            ['s'] = actions.select_vertical,
          },
        },
      },
      pickers = {},
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }
    local keymap = vim.keymap.set

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'project')
    pcall(require('telescope').load_extension, 'bookmarks')
    pcall(require('telescope').load_extension, 'ui-select')

    -- fuzzy find and search
    keymap('n', '<leader>sh', builtin.help_tags, { desc = 'Search [H]elp' })
    keymap('n', 'sh', builtin.help_tags, { desc = 'Search [H]elp' })
    keymap('n', '<leader>sk', builtin.keymaps, { desc = 'Search [K]eymaps' })
    keymap('n', 'sk', builtin.keymaps, { desc = 'Search [K]eymaps' })
    keymap('n', '<leader>sf', builtin.find_files, { desc = 'Search [F]iles' })
    keymap('n', 'sf', builtin.find_files, { desc = 'Search [F]iles' })
    keymap('n', 'ff', builtin.find_files, { desc = 'Search [F]iles' })
    keymap('n', 'ss', builtin.builtin, { desc = 'Search [S]elect Telescope' })
    keymap('n', '<leader>ss', builtin.builtin, { desc = 'Search [S]elect Telescope' })
    keymap({ 'n', 'v' }, 'sw', builtin.grep_string, { desc = 'Search current [W]ord' })
    keymap({ 'n', 'v' }, '<leader>sw', builtin.grep_string, { desc = 'Search current [W]ord' })
    keymap('n', 'sg', builtin.live_grep, { desc = 'Search by [G]rep' })
    keymap('n', '<leader>sg', builtin.live_grep, { desc = 'Search by [G]rep' })
    keymap('n', 'F', builtin.live_grep, { desc = 'Search by [G]rep' })
    keymap('n', 'sd', builtin.diagnostics, { desc = 'Search [D]iagnostics' })
    keymap('n', '<leader>sd', builtin.diagnostics, { desc = 'Search [D]iagnostics' })
    keymap('n', 'sR', builtin.resume, { desc = 'Search [R]esume' })
    keymap('n', '<leader>sR', builtin.resume, { desc = 'Search [R]esume' })
    keymap('n', 'sr', builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
    keymap('n', '<leader>sr', builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
    keymap('n', 'st', '<cmd>TodoTelescope<cr>', { desc = 'Search todos' })
    keymap('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = 'Search todos' })
    keymap('n', '<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    keymap('n', '?', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = '[/] Fuzzily Search in current buffer' })

    keymap('n', '<leader>so', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Search [/] in Open Files' })

    keymap('n', 'so', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Search [/] in Open Files' })

    -- Shortcut for Searching your Neovim configuration files
    keymap('n', 'sc', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Search [N]eovim files' })
    keymap('n', '<leader>sc', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Search [N]eovim files' })

    -- git
    keymap('n', '<leader>gf', function()
      builtin.git_files()
    end, { desc = 'Git Files' })
    keymap('n', '<leader>gS', function()
      builtin.git_stash()
    end, { desc = 'Git Stash' })
    keymap('n', '<leader>gs', function()
      builtin.git_status()
    end, { desc = 'Git Stash' })
    keymap('n', '<leader>gb', function()
      builtin.git_branches()
    end, { desc = 'Git Branches' })
    keymap('n', '<leader>gc', function()
      builtin.git_commits()
    end, { desc = 'Git Commits' })
  end,
}
