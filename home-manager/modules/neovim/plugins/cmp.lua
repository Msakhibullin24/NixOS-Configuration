local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end

local config = {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-j>"] = cmp.mapping(function(fallback)
			if require("luasnip").expandable() then
				require("luasnip").expand()
			elseif require("luasnip").expand_or_jumpable() then
				require("luasnip").expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if require("luasnip").jumpable(-1) then
				require("luasnip").jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<cr>"] = cmp.mapping.confirm({ select = true }),
	}),

	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "cmp_tabby" },
		{ name = "luasnip" },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{ name = "neorg" },
	},
}

cmp.setup(config)
