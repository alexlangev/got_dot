return {
    {
        -- move text around with vim keys
        'nvim-mini/mini.move',
        version = false,
        opts = {},
    },
    {
        "nvim-mini/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        },
    },
    {
        -- sets the tabs rules to whatever the file uses. Maybe even what the project uses...?
        "NMAC427/guess-indent.nvim",
        opts = {},
    },
    -- Can't make this one work...
    -- {
    --     -- TODO
    --     "folke/todo-comments.nvim",
    --     event  = "Lazy",
    --     dependencies = { "nvim-lua/plenary.nvim" },
    --     opts = {}
    -- }
}
