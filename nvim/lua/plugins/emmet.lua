return {
	"mattn/emmet-vim",
	config = function()
		-- Optional: Configure Emmet (custom snippets can be added via vimscript)
		vim.g.user_emmet_settings = {
			html = {
				snippets = {
					script = '<script src=""></script>',
				},
			},
		}
		-- Set trigger key and ensure normal mode after expansion
		vim.keymap.set("i", "<C-e>", function()
			vim.fn["emmet#expandAbbr"](1, "") -- Expand the snippet
			vim.cmd("stopinsert") -- Exit insert mode to normal mode
			return ""
		end, { expr = true })
	end,
}
