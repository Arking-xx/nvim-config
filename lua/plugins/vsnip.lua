return {
	"hrsh7th/vim-vsnip",
	config = function()
		vim.g.vsnip_snippet_dir = vim.fn.expand("~/.config/nvim/snippets")

		-- Optional: Set vsnip filetypes
		vim.g.vsnip_filetypes = {
			javascriptreact = { "javascript" },
			typescriptreact = { "typescript", "javascript" }
		}
	end
}
