local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	return
end

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = "scss",
	callback = function()
		require("luasnip").config.set_config({
			parser_options = {
				dollar_is_word = false,
			},
		})
	end,
})

luasnip.setup()
