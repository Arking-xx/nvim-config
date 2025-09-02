return {
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "deep",
				transparent = true,
				highlights = {
					CursorLine = { bg = "#444b5a" },
					Visual ={ bg = "#505868" }, 
					Comment = {fg = '#7c8'},
					["@comment"] = { fg = "#7c8", fmt = "italic" },
				},
				diagnostics = {
					darker = false,
					undercurl = true,
					background = false
				},
				code_style = {
					comments = 'italic',
					keywords = 'italic',
					functions = 'italic',
					strings = 'none',
					variables = 'bold'
				},
			})
			require("onedark").load()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "onedark",
				},
			})
		end,
	},
	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_enabled = 1
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
}
