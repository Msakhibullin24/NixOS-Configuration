local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
	return
end

local config = {
	floating = {
		mappings = {
			close = { "q", "<esc>" },
		},
	},
	controls = {
		enabled = true,
		element = "console",
	},
}

dapui.setup(config)
