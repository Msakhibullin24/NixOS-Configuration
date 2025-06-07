local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local config = {
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename", "diff" },
		lualine_x = {
			function()
				local msg = ""
				local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			"diagnostics",
			"encoding",
			"filetype",
		},
	},
}

lualine.setup(config)
