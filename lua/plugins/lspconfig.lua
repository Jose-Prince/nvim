return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lsp = require('lspconfig')

      -- Python LSP configuration (Pyright)
      nvim_lsp.pyright.setup{
        on_attach = function(client, bufnr)
          -- Configura las teclas para la navegación de LSP
          local buf_set_keymap = vim.api.nvim_buf_set_keymap
          local opts = { noremap=true, silent=true }
          buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
          buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
          buf_set_keymap(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
        end,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true
            }
          }
        }
      }

      -- Lua configuration (lua_ls)
      nvim_lsp.lua_ls.setup{
	    on_attach = function(client, bufnr)
		local buf_set_keymap = vim.api.nvim_buf_set_keymap
		local opts = { noremap=true, silent=true }
		buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
        end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("",true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
      }

      -- Html configuration (html)
      nvim_lsp.html.setup{
          on_attach = function(client, bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
    		local opts = { noremap=true, silent=true }
	    	buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
        end,
      }
      -- CSS configuration (cssls)
      nvim_lsp.cssls.setup{
        on_attach = function(client, bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
		    local opts = { noremap=true, silent=true }
		    buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
        end,
      }
      -- JS configuration (ts_ls)
      nvim_lsp.ts_ls.setup{
          on_attach = function(client,bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
		    local opts = { noremap=true, silent=true }
    		buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
        end,
      }
      -- Vue configuration (volar)
      nvim_lsp.volar.setup {
          cmd = {"vue-language-server", "--stdio"},
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'vue', 'json' },
          init_options = {
              typescript = {
                  tsdk = '/usr/lib/node_modules/typescript/lib'
              },
          },

          on_attach = function(client, bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
		    local opts = { noremap=true, silent=true }
    		buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
        end,
      }
      -- Go configuration (gopls)
      nvim_lsp.gopls.setup{
          on_attach = function(client,bufnr)
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
		    local opts = { noremap=true, silent=true }
    		buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
          	buf_set_keymap(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
        end,
      }
    end
  }
}
