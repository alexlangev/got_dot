return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            -- Search files in directory
            vim.keymap.set("n", "<space>ff", function()
                local opts = require('telescope.themes').get_dropdown({})
                require('telescope.builtin').find_files(opts)
            end)


            -- Search files in ~/.config/nvim
            vim.keymap.set("n", "<space>fn", function()
                local opts = require('telescope.themes').get_dropdown({
                    cwd = vim.fn.stdpath("config")
                })
                require('telescope.builtin').find_files(opts)
            end)


            -- Search files in ~/mindlab/
            vim.keymap.set("n", "<space>fm", function()
                local opts = require('telescope.themes').get_dropdown({
                    cwd = "~/mindlab"
                })
                require('telescope.builtin').find_files(opts)
            end)


            -- Search files in ~/mindlab/
            vim.keymap.set("n", "<space><space>", function()
                local opts = require('telescope.themes').get_dropdown({})
                require('telescope.builtin').buffers()
            end)

            -- Grep word under cursor
            vim.keymap.set('n', '<leader>sw', function()
                local opts = require('telescope.themes').get_dropdown({})
                require('telescope.builtin').grep_string()
            end)

            vim.keymap.set('n', '<leader>sg', function()
                local opts = require('telescope.themes').get_dropdown({})
                require('telescope.builtin').live_grep()
            end)
        end
    }
}
