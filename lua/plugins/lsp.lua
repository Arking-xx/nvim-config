return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- Set up Mason
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"eslint",
				"ts_ls",
				"html",
				"emmet_ls",
				"pyright", -- Add pyright here too
			},
		})

		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Get default capabilities from cmp-nvim-lsp
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Common on_attach function for all LSP servers
		local on_attach = function(client, bufnr)
			-- Enable completion triggered by <c-x><c-o>
			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

			-- Key mappings for LSP functionality
			local opts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		end

		-- Lua LSP
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- Python LSP
		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- ESLint LSP
		lspconfig.eslint.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
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
		})

		-- TypeScript LSP
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		})

		-- HTML LSP
		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "ejs" },
		})

		-- Emmet LSP
		lspconfig.emmet_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"html",
				"css",
				"javascriptreact",
				"typescriptreact",
			},
		})

		-- Global diagnostics configuration
		vim.diagnostic.config({
			virtual_text = {
				prefix = "●",
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
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		-- Define diagnostic signs
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}
