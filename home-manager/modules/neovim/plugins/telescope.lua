local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

local config = {
	defaults = {
		mappings = {
			n = {
				["<esc>"] = actions.close,
			},
		},
		file_ignore_patterns = {
			"^.git/",
			"^.mypy_cache/",
			"^.__pycache__/",
			"^output/",
			"^data/",
			"%.ipynb",
		},
	},
}

telescope.setup(config)
