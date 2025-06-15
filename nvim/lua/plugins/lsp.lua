return {
    {
        -- lsp manager
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        -- connects mason to lsp-config
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "gopls",
                "ts_ls"
            }
        },
    },
    {
        -- communication between nvim and lsp
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({})
            lspconfig.gopls.setup({})
            lspconfig.ts_ls.setup({})
            lspconfig.html.setup({})
            lspconfig.cssls.setup({})
            lspconfig.css_variables.setup({})

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local c = vim.lsp.get_client_by_id(args.data.client_id)
                    if not c then return end

                    -- Format the current buffer on save
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
                        end,
                    })
                end
            })
        end,
    },
    {
        -- Fixes nvim specific lua lsp things
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
