-- return {

-- 	{
-- 		"projekt0n/github-nvim-theme",
-- 		name = "github-theme",
-- 		lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- 		priority = 1000, -- make sure to load this before all the other start plugins
-- 		config = function()
-- 			require("github-theme").setup({
-- 				options = {
-- 					styles = {
-- 						comments = "italic",
-- 						functions = "italic",
-- 						conditionals = "italic",
-- 					},
-- 					inverse = {
-- 						match_paren = true,
-- 						visual = true,
-- 						search = true,
-- 					},
-- 				},
-- 			})
--
-- 			vim.cmd("colorscheme github_dark_default")
-- 		end,
-- 	},
-- 	{
-- 		"nvim-lualine/lualine.nvim",
-- 		dependencies = { "nvim-tree/nvim-web-devicons" },
-- 		config = function()
-- 			require("lualine").setup({
-- 				options = {
-- 					theme = "auto", -- Automatically adapt to github_dark_default
-- 					section_separators = { left = "", right = "" }, -- Optional: Fancy separators
-- 					component_separators = { left = "", right = "" }, -- Optional: Fancy separators
-- 					globalstatus = true, -- Single statusline for all windows
-- 				},
-- 				sections = {
-- 					lualine_a = { "mode" },
-- 					lualine_b = { "branch" },
-- 					lualine_c = { "filename" },
-- 					lualine_x = { "encoding", "fileformat", "filetype" },
-- 					lualine_y = { "progress" },
-- 					lualine_z = { "location" },
-- 				},
-- 				inactive_sections = {
-- 					lualine_a = {},
-- 					lualine_b = {},
-- 					lualine_c = { "filename" },
-- 					lualine_x = { "location" },
-- 					lualine_y = {},
-- 					lualine_z = {},
-- 				},
-- 				extensions = { "nvim-tree" }, -- Integrate with nvim-tree if used
-- 			})
-- 		end,
-- 	},
-- 	{
-- 		"andymass/vim-matchup",
-- 		config = function()
-- 			vim.g.matchup_matchparen_enabled = 1
-- 			vim.g.matchup_matchparen_offscreen = { method = "popup" }
-- 			vim.g.matchup_matchparen_offscreen_popup_options = {
-- 				row = 1, -- Position at the top (1 is the first row)
-- 				col = 1, -- Align with the left
-- 				pos = "topleft", -- Anchor to top-left
-- 				border = true,
-- 			}
-- 		end,
-- 	},
-- }
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = {
					dark = "mocha",
				},
				transparent_background = true,
				term_colors = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = true,
					notify = true,
					mini = true,
					treesitter = true,
					-- Removed matchup = true, as it’s not supported
				},
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					functions = { "bold", "italic" },
					keywords = { "italic" },
				},
				custom_highlights = function(colors)
					return {
						LineNr = { fg = colors.overlay0 },
						CursorLineNr = { fg = "#FFFFFF", bg = colors.overlay0 },
						MatchParen = { fg = "#FFFFFF", bold = true },
						CursorLine = { bg = colors.overlay0 },
						Cursor = { fg = "#000000" },
						Visual = { fg = "#000000", bg = colors.yellow },
						["@tag"] = { fg = colors.blue, bold = true },
						["@tag.delimiter"] = { fg = colors.sky },
						["@tag.attribute"] = { fg = colors.green },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
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
