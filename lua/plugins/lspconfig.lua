return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Configure diagnostics
      vim.diagnostic.config({
        virtual_text = {
          enabled = true,
          source = "if_many",
          prefix = "●", -- Could be '■', '▎', 'x', '●', etc.
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- Define diagnostic signs
      local signs = {
        Error = "✘",
        Warn = "▲",
        Hint = "⚑",
        Info = "»"
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Keymaps for diagnostics
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Set diagnostic loclist' })
    end
  }
}
