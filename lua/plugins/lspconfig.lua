return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lsp = require('lspconfig')

      -- Configuración de Pyright para Python
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
    end
  }
}

