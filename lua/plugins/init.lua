-- Call for plugins
return {
	{"neovim/nvim-lspconfig"},
	{ "hrsh7th/nvim-cmp" },
	{"L3MON4D3/LuaSnip"},      
    	{ "hrsh7th/cmp-nvim-lsp" },
    	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "nvim-lua/lsp-status.nvim" },
	{ "python-lsp/python-lsp-server" },
	{"nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{"nvim-lua/plenary.nvim"},
	{"nvim-telescope/telescope.nvim"},
}
