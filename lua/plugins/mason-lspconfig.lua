-- ~/.config/nvim/lua/plugins/mason-lspconfig.lua

local function map_lsp_keys(bufnr)
  local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  
  -- Additional diagnostic keymaps
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

return {
  {
    "williamboman/mason-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local mason_lspconfig = require("mason-lspconfig")
      
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "html",
          "cssls",
          "ts_ls",
          "gopls",
        },
        handlers = {
          -- Default handler
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_attach = function(client, bufnr)
                map_lsp_keys(bufnr)  -- Use local function instead of requiring non-existent module
                
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                
                -- Auto-show diagnostics in hover window
                vim.api.nvim_create_autocmd("CursorHold", {
                  buffer = bufnr,
                  callback = function()
                    local opts = {
                      focusable = false,
                      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                      border = 'rounded',
                      source = 'always',
                      prefix = ' ',
                      scope = 'cursor',
                    }
                    vim.diagnostic.open_float(nil, opts)
                  end
                })
              end,
            })
          end,
          
          -- Lua specific configuration
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              on_attach = function(client, bufnr)
                map_lsp_keys(bufnr)
              end,
              settings = {
                Lua = {
                  runtime = {
                    version = 'LuaJIT',
                  },
                  diagnostics = {
                    globals = { 'vim' },
                  },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                  },
                  telemetry = {
                    enable = false,
                  },
                  completion = {
                    callSnippet = "Replace",
                  },
                },
              },
            })
          end,
          
          -- Python specific configuration
          ["pyright"] = function()
            lspconfig.pyright.setup({
              capabilities = capabilities,
              on_attach = function(client, bufnr)
                map_lsp_keys(bufnr)
              end,
              settings = {
                python = {
                  analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                  }
                }
              }
            })
          end,
          
          -- Vue specific configuration
          ["volar"] = function()
            lspconfig.volar.setup({
              capabilities = capabilities,
              on_attach = function(client, bufnr)
                map_lsp_keys(bufnr)
              end,
              cmd = {"vue-language-server", "--stdio"},
              filetypes = { 'typescript', 'javascript', 'javascriptreact', 'vue', 'json' },
              init_options = {
                typescript = {
                  tsdk = '/usr/lib/node_modules/typescript/lib'
                },
              },
            })
          end,
        }
      })
    end,
  }
}
