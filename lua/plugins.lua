local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Theme and UI
  {
    'rebelot/kanagawa.nvim', -- Kanagawa's theme for Neovim
  },
  'nvim-lualine/lualine.nvim', -- Statusline plugin for enhanced UI

  -- Syntax and Language Support
  'nvim-treesitter/nvim-treesitter', -- Better syntax highlighting and code understanding
  {
    "fatih/vim-go", -- Comprehensive Go development plugin
    ft = "go",
    build = ":GoUpdateBinaries",
  },

  -- LSP (Language Server Protocol) Support
  {
    "williamboman/mason.nvim", -- LSP package manager
    dependencies = { { "williamboman/mason-lspconfig.nvim" } }
  },
  "neovim/nvim-lspconfig", -- LSP configuration
  "glepnir/lspsaga.nvim", -- Enhanced LSP UI
  'onsails/lspkind.nvim', -- VSCode-like pictograms for LSP

  -- Completion and Snippets
  {
    "hrsh7th/nvim-cmp", -- Completion engine
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-calc',
      'saadparwaiz1/cmp_luasnip',
    },
  },
  'hrsh7th/nvim-dansa', -- Smart indentation detection
  {
    "L3MON4D3/LuaSnip", -- Snippet engine
    version = "v2.*",
    build = "make install_jsregexp"
  },

  -- Fuzzy Finding and Navigation
  {
    'nvim-telescope/telescope.nvim', -- Fuzzy finder and picker
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Oil tree search
  {
    'stevearc/oil.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  'windwp/nvim-autopairs', -- Autocompletition for pair symbols
  'ojroques/vim-oscyank',
}

local opts = {}

require("lazy").setup(plugins, opts)
