local nvim_treesitter = require('nvim-treesitter.configs')
nvim_treesitter.setup{
  ensure_installed = {
	  "python",
    "typescript",
    "tsx",
    "javascript",
    "html",
    "css",
    "json",
    "lua",
    "cpp",
	},

  sync_install = false,
	auto_install = true,
  highlight = {
    enable = true,
	  additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
