vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.ejs", "*._ejs" },
	callback = function()
		vim.bo.filetype = "ejs"
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "ejs",
	callback = function()
		vim.treesitter.language.register("embedded_template", "ejs")
	end,
})
