return {
    'echasnovski/mini.files',
    version = false,
    opts = {
        windows = {
            preview = true,
            width_focus = 30,
            width_preview = 60,
        }
    },
    keys = {
        {
            "<leader>fe",
            function()
                require("mini.files").open()
            end,
            desc = "Open Mini Files",
        },
    },
    init = function()
        -- Auto open mini.files if Neovim is launched with a directory
        if vim.fn.argc() == 1 then
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == "directory" then
                vim.api.nvim_create_autocmd("VimEnter", {
                    callback = function()
                        require("mini.files").open(vim.fn.argv(0))
                    end,
                })
            end
        end
    end,
}
