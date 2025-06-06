return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"eslint",
				"ts_ls",
				"html",
				"emmet_ls", -- ensure emmet_ls is installed too
			},
		})

		local lspconfig = require("lspconfig")

		-- Lua LSP
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- ESLint LSP
		lspconfig.eslint.setup({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"ejs",
			},
			settings = {
				workingDirectory = { mode = "auto" },
				codeActionOnSave = {
					enable = true,
					mode = "all",
				},
				format = true,
				quiet = false,
			},
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})

		-- TypeScript LSP (tsserver replacement)
		lspconfig.ts_ls.setup({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"ejs",
			},
		})

		-- HTML LSP
		lspconfig.html.setup({
			filetypes = { "html", "ejs" },
		})

		-- Emmet LSP (for HTML/CSS-like snippets)
		lspconfig.emmet_ls.setup({
			filetypes = {
				"html",
				"css",
				"ejs",
				"javascriptreact",
				"typescriptreact",
			},
		})

		-- Global diagnostics configuration
		vim.diagnostic.config({
			virtual_text = {
				prefix = "",
				format = function(diagnostic)
					local message = diagnostic.message
					if message:match("^eslint:") then
						return message:gsub("^eslint:", "")
					end
					return message
				end,
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})
	end,
}
