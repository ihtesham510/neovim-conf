-- cargo.toml

return {
  "saecki/crates.nvim",
  ft = { "rust", "toml" },
  config = function()
    local crates = require("crates")
    local keymap = vim.keymap.set
    crates.setup({
      src = {
        cmp = {
          enabled = true,
        },
      },
    })
    keymap("n", "<leader>cu", "<cmd>lua require('crates').update_crate()<CR>", { desc = "Update crate" })
    keymap("n", "<leader>cU", "<cmd>lua require('crates').update_all_crates()<CR>", { desc = "Update all crates" })
    keymap("n", "<leader>ci", "<cmd>lua require('crates').show_popup()<CR>", { desc = "Crate Info" })
    keymap(
      "n",
      "<leader>cd",
      "<cmd>lua require('crates').show_dependencies_popup()<CR>",
      { desc = "Crate Dependencies" }
    )
    keymap(
      "n",
      "<leader>cv",
      "<cmd>lua require('crates').show_versions_popup()<CR><cmd>lua require('crates').show_versions_popup()<CR>",
      { desc = "Crate version" }
    )
    keymap(
      "n",
      "<leader>cf",
      "<cmd>lua require('crates').show_features_popup()<CR><cmd>lua require('crates').show_features_popup()<CR>",
      { desc = "Crate features" }
    )
  end,
}
