local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
	return
end

local config = {
	progress = {
		suppress_on_insert = true,
	},
	notification = {
		override_vim_notify = true,
		window = {
			winblend = 0,
		},
	},
	logger = {
		float_precision = 1.0e-2,
	},
}

fidget.setup(config)
