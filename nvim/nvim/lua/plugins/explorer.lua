return {
    {
        "echasnovski/mini.files",
        opts = {
            windows = {
                preview = true,
                width_focus = 30,
                width_preview = 60,
            },
        },
        keys = {
            {
                "<leader>ef",
                function()
                    require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
                end,
                desc = "Open mini.files (Directory of Current File)",
            },
            {
                "<leader>ed",
                function()
                    require("mini.files").open(vim.uv.cwd(), true)
                end,
                desc = "Open mini.files (cwd)",
            },
        },
        config = function()
            require("mini.files")
        end
    }
}
