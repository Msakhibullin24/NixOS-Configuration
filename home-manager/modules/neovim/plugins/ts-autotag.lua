local status_ok, tsautotag = pcall(require, "nvim-ts-autotag")
if not status_ok then
	return
end

tsautotag.setup()
