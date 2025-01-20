-- Initial configuration with Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then 
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("settings")
require("keymaps")
require("plugins")

-- Cambiar el color de las variables
vim.api.nvim_set_hl(0, "@variable", { fg = "#FFD700" }) -- Color dorado para variables
vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#FF4500", italic = true }) -- Color rojo anaranjado para variables predefinidas

