-- ~/.config/nvim/lua/plugins/nvim-cmp.lua


return {
  {
  "hrsh7th/nvim-cmp",
  setup = function()
    local cmp = require'cmp'
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)  -- Expande los snippets usando LuaSnip
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),  -- Abre el autocompletado
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirmar selección
      }),
      sources = {
        { name = 'nvim_lsp' },  -- Habilita el autocompletado con LSP
        { name = 'luasnip' },    -- Habilita los snippets de LuaSnip
        { name = 'buffer' },     -- Autocompletado desde el buffer
        { name = 'path' },       -- Autocompletado de rutas de archivos
      },
    })
  end
}
}

