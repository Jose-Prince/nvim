-- ~/.config/nvim/lua/plugins/LuaSnip.lua

return {
    {
        "L3MON4D3/LuaSnip", 
        config = function()
            local luasnip = require('luasnip')

            -- Configura los snippets de LuaSnip
            luasnip.config.set_config({
                history = true,
                updateevents = "TextChanged,TextChangedI",
            })

            -- Cargar snippets desde archivos de VSCode
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Define algunos snippets básicos para Python
            luasnip.snippets = {
                python = {
                    luasnip.parser.parse_snippet("func", "def ${1:name}(${2:args}):\n\t${0}"),
                    luasnip.parser.parse_snippet("cls", "class ${1:ClassName}(${2:object}):\n\t${0}"),
                },
            }
        end
    }
}
