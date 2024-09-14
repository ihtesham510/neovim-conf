return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  config = function()
    local crates = require("crates")
    local keymap = vim.keymap.set
    local opts = { silent = true }
    local function show_features_popover()
      crates.show_features_popup()
      crates.show_features_popup()
    end

    opts.desc = "Toggle crates"
    keymap("n", "<leader>ct", crates.toggle, opts)
    opts.desc = "Reload crates"
    keymap("n", "<leader>cr", crates.reload, opts)

    opts.desc = "Show crates version"
    keymap("n", "<leader>cv", crates.show_versions_popup, opts)
    opts.desc = "add / remove crates features"
    keymap("n", "<leader>cf", show_features_popover, opts)
    opts.desc = "Show crates dependencies"
    keymap("n", "<leader>cd", crates.show_dependencies_popup, opts)

    opts.desc = "update crate"
    keymap({ "n", "v", "x" }, "<leader>cu", crates.update_crate, opts)
    opts.desc = "update all crates"
    keymap("n", "<leader>ca", crates.update_all_crates, opts)
    opts.desc = "upgrade crate"
    keymap({ "n", "v", "x" }, "<leader>cU", crates.upgrade_crate, opts)
    opts.desc = "upgrade all crates"
    keymap("n", "<leader>cA", crates.upgrade_all_crates, opts)

    opts.desc = "open crates homepage"
    keymap("n", "<leader>ch", crates.open_homepage, opts)
    opts.desc = "open crates homepage"
    keymap("n", "<leader>cr", crates.open_repository, opts)
    opts.desc = "open crates repository"
    keymap("n", "<leader>cd", crates.open_documentation, opts)
    opts.desc = "open in crates.io"
    keymap("n", "<leader>cc", crates.open_crates_io, opts)
    opts.desc = "open in lib.rs"
    keymap("n", "<leader>cl", crates.open_lib_rs, opts)

    require("crates").setup({
      completion = {
        cmp = {
          enabled = true,
        },
      },
    })
  end,
}
