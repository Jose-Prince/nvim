return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local nvim_treesitter = require('nvim-treesitter.configs')  

      nvim_treesitter.setup {

	ensure_installed = {
	   "python",
	},

	auto_install = true,

        highlight = {
          enable = true,
	  additional_vim_regex_highlighting = false,
        },
      }

      -- Configuración de colores
      vim.cmd [[
        highlight TSVariable guifg=#FF0000      " Cambiar color de variables
        highlight TSFunction guifg=#00FF00      " Cambiar color de funciones
        highlight TSKeyword guifg=#0000FF       " Cambiar color de palabras clave
        highlight TSString guifg=#FFFF00        " Cambiar color de cadenas
      ]]
    end,
  }
}
