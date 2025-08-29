-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,          -- Load immediately
		priority = 1000,       -- Load before other plugins
		opts = {
			style = "moon",      -- Preferred style: "storm", "moon", "night", or "day"
			transparent = false, -- Set to true for transparent background
			terminal_colors = true, -- Enable terminal colors
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "dark", -- Style for sidebars
				floats = "dark", -- Style for floating windows
			},
			day_brightness = 0.3, -- Brightness for "day" style (0 to 1)
			dim_inactive = false, -- Dim inactive windows
			lualine_bold = false, -- Bold section headers in lualine
		},
		config = function()
			vim.cmd([[colorscheme tokyonight]]) -- Apply the colorscheme
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
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
