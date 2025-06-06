return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	keys = {
		{
			"<leader>e",
			"<cmd>NvimTreeToggle<cr>",
			desc = "Toggle NvimTree",
		},
		{
			"<leader>p",
			function()
				local api = require("nvim-tree.api")
				local node = api.tree.get_node_under_cursor()
				if node and node.type == "file" then
					require("image_preview").PreviewImage(node.absolute_path)
				else
					print("No file selected or invalid node")
				end
			end,
			desc = "Preview image in WezTerm",
			mode = "n",
			buffer = nil,
		},
	},
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end
				-- Default mappings
				api.config.mappings.default_on_attach(bufnr)
				-- Custom mapping for image preview
				vim.keymap.set("n", "<leader>p", function()
					local node = api.tree.get_node_under_cursor()
					if node and node.type == "file" then
						require("image_preview").PreviewImage(node.absolute_path)
					else
						print("No file selected or invalid node")
					end
				end, opts("Preview image in WezTerm"))
			end,
		})
	end,
}
