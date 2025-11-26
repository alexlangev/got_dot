return {
    {
        'nvim-mini/mini.pick',
        version = false,
        opts = {},
        config = function(_, opts)
            require('mini.pick').setup(opts)
            
            -- Set keymaps for mini.pick
            vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', { noremap = true, silent = true, desc = 'Pick files' })
            vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep live<cr>', { noremap = true, silent = true, desc = 'Pick grep' })
            vim.keymap.set('n', '<leader><leader>', '<cmd>Pick buffers<cr>', { noremap = true, silent = true, desc = 'Pick buffers' })
        end,
    },
}
