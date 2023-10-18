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
    keymap("n", "<leader>Cu", "<cmd>lua require('crates').update_crate()<CR>", { desc = "Update crate" })
    keymap("n", "<leader>CU", "<cmd>lua require('crates').update_all_crates()<CR>", { desc = "Update all crates" })
    keymap("n", "<leader>Ci", "<cmd>lua require('crates').show_popup()<CR>", { desc = "Crate Info" })
    keymap(
      "n",
      "<leader>Cd",
      "<cmd>lua require('crates').show_dependencies_popup()<CR>",
      { desc = "Crate Dependencies" }
    )
    keymap(
      "n",
      "<leader>Cv",
      "<cmd>lua require('crates').show_versions_popup()<CR><cmd>lua require('crates').show_versions_popup()<CR>",
      { desc = "Crate version" }
    )
    keymap(
      "n",
      "<leader>Cf",
      "<cmd>lua require('crates').show_features_popup()<CR><cmd>lua require('crates').show_features_popup()<CR>",
      { desc = "Crate features" }
    )
  end,
}
