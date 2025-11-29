return {
    -- main lsp plugin
    "neovim/nvim-lspconfig",
    dependencies = {
        -- an lsp manager, type :Mason
        "williamboman/mason.nvim",

        -- the bridge between Mason and lspconfig
        "williamboman/mason-lspconfig.nvim",

        -- a set of lua specific configs for neovim files
        "folke/lazydev.nvim",
    },

    config = function()
        require("lazydev").setup() -- this one must be called first for some reason...
        require("mason").setup()

        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                "gopls", -- go
                "lua_ls", -- lua
                "jsonls", -- json
                "marksman", -- markdown
                "pyright", -- python
                "solidity",
                -- skipping sql, a plugin will handle it
                "ts_ls", -- ts
             },
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        -- TODO: language specific configs

        local installed_servers = mason_lspconfig.get_installed_servers()

        for _, server_name in ipairs(installed_servers) do
            vim.lsp.enable(server_name)
        end
    end,
}
