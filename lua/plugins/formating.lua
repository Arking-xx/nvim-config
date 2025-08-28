return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd", "prettier" },
					typescript = { "prettierd", "prettier" },
					javascriptreact = { "prettierd", "prettier" },
					typescriptreact = { "prettierd", "prettier" },
					html = { "prettierd", "prettier" },
					css = { "prettierd", "prettier" },
					json = { "prettierd", "prettier" },
					markdown = { "prettierd", "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters = {
					prettier = {
						-- Force Prettier to always use your global config
						prepend_args = { "--config", vim.fn.expand("~/.prettierrc.json") },
					},
					prettierd = {
						-- prettierd ignores --config, so prettier will be fallback
						prepend_args = { "--config", vim.fn.expand("~/.prettierrc.json") },
					},
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
}
