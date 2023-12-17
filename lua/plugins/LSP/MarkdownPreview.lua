return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	keys = {
		{
			"<leader>P",
			function()
				vim.cmd([[MarkdownPreviewToggle]])
			end,
			desc = "Peek (Markdown Preview)",
		},
	},
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
}
