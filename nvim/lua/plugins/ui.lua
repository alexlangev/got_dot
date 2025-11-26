return {
    {   
        'nvim-mini/mini.cursorword',
        version = false,
        opts = {},
    },
    {
        'nvim-mini/mini.indentscope',
        version = false,
        opts = {
            symbol = '│',
            delay = 1,
        },
        config = function(_, opts)
            require('mini.indentscope').setup(vim.tbl_deep_extend('force', opts, {
                draw = { animation = function() return 0 end }
            }))
        end,
    },
    {
        'nvim-mini/mini.starter',
        version = false,
        opts = function()
            local starter = require('mini.starter')
            return {
                header = [[
▄▄▄▄  ▗▞▀▚▖ ▄▄▄  ▗▖  ▗▖▄ ▄▄▄▄  
█   █ ▐▛▀▀▘█   █ ▐▌  ▐▌▄ █ █ █ 
█   █ ▝▚▄▄▖▀▄▄▄▀ ▐▌  ▐▌█ █   █ 
                  ▝▚▞▘          ]],
                footer = "",
                silent = true,
                items = {
                    starter.sections.recent_files(5, false, false),
                    { 
                        action = 'Lazy', 
                        name = 'Lazy', 
                        section = 'Plugins' 
                    },
                    {
                        action = 'enew',
                        name = 'New File',
                        section = 'Actions'
                    },
                    {
                        action = 'quit',
                        name = 'Quit',
                        section = 'Actions'
                    },
                }
            }
        end,
    },
    {
        "sphamba/smear-cursor.nvim",
        event = "VeryLazy",
        opts = {
            stiffness = 0.8,
            trailing_stiffness = 0.8,
            never_draw_over_target = false,
        },
    },
    {
        -- Ugly beautiful. I like it.
        "nvim-mini/mini.icons",
        lazy = true,
        opts = {
            -- copied from Lazy. Folke knows best
            file = {
                [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
                ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
            },
            -- copied from Lazy. Folke knows best
            filetype = {
                dotenv = { glyph = "", hl = "MiniIconsYellow" },
            },
        },
        -- Intercepts the loading of nvim-web-devicons and replaces it with mini.icons.
        -- Copied from Lazy
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-mini/mini.icons',
        },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            -- Only render markdown in normal mode
            render_modes = {'n'},
            heading = {
                sign = false,
            },
            code = {
                sign = false,
                position = 'right',
                width = 'block',
            },
        },
    },
}
