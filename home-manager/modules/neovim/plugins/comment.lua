local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

local config = {
	toggler = {
		line = "gcc",
		block = "gbc",
	},
	opleader = {
		line = "gc",
		block = "gb",
	},
}

comment.setup(config)
