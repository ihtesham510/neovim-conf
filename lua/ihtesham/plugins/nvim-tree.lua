return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")
    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- copy default mappings here from defaults in next section
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
      -- ---
      -- -- OR use all default mappings
      api.config.mappings.default_on_attach(bufnr)
      --
      -- -- remove a default
      -- vim.keymap.del("n", "<C-]>", { buffer = bufnr })
      --
      -- -- override a default
      -- vim.keymap.set("n", "<C-e>", api.tree.reload, opts("Refresh"))
      --
      -- -- add your mappings
      -- vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    end

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      on_attach = my_on_attach,
      view = {
        width = 45,
        relativenumber = false,
      },
      update_focused_file = {
        enable = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        -- icons = {
        --   glyphs = {
        --     folder = {
        --       arrow_closed = "", -- arrow when folder is closed
        --       arrow_open = "", -- arrow when folder is open
        --     },
        --   },
        -- },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = { ".DS_Store", "node_modules" },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>e", "<cmd>NvimTreeOpen<CR>", { desc = "Open file explorer" }) -- toggle file explorer
    keymap.set("n", "t", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
  end,
}
