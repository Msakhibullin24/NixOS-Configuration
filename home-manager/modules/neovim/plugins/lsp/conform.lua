local status_ok, conform = pcall(require, "conform")
if not status_ok then
	return
end

local config = {
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		-- nixfmt-rfc-style
		nix = { "nixfmt" },
		-- stylua
		lua = { "stylua" },
		-- astyle
		java = { "astyle" },
		-- clang-tools
		cpp = { "clang-format" },
		-- shfmt
		bash = { "shfmt" },
		-- black
		python = { "black" },
		-- gdtoolkit_4
		godot = { "gdformat" },
		-- prettierd
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		svelte = { "prettierd", "prettier", stop_after_first = true },
		-- superhtml
		html = { "superhtml" },
		-- stylelint
		css = { "stylelint" },
		-- codespell
		["*"] = { "codespell" },

		-- nothing
		["_"] = { "trim_whitespace" },
	},
}

conform.setup(config)
