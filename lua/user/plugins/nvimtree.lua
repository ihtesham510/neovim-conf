local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- copy default mappings here from defaults in next section
	vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
	---
	-- OR use all default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- remove a default
	vim.keymap.del("n", "<C-]>", { buffer = bufnr })

	-- override a default
	vim.keymap.set("n", "<C-e>", api.tree.reload, opts("Refresh"))

	-- add your mappings
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	---
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
end

return {
	"kyazdani42/nvim-tree.lua",
	lazy = false,

	config = function()
		local nvim_tree = require("nvim-tree")
		nvim_tree.setup({
			on_attach = my_on_attach,
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			renderer = {
				root_folder_modifier = ":t",
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			view = {
				width = 52,
				side = "left",
			},
		})
	end,
}
