return {
    { 
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('nightfox').setup({
                options = {
                    transparent = true,
                    styles = {
                        comments = "italic",
                        conditionals = "NONE",
                        constants = "NONE",
                        functions = "NONE",
                        keywords = "NONE",
                        numbers = "NONE",
                        operators = "NONE",
                        strings = "NONE",
                        types = "NONE",
                    }
                }
            })
            vim.cmd([[colorscheme carbonfox]])
        end,
    }
}
