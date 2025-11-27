return {
	-- Core LSP plugin
	-- contains default configs for the LSP's you download using Mason
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- LSP installer
			{ "williamboman/mason.nvim", config = true },
			-- The bridge between mason and lspconfig
			"williamboman/mason-lspconfig.nvim",

			-- Fixes issues with vim config files
			{ "folke/lazydev.nvim",      opts = {} },

			-- Adds more capabilities to the lsp client
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- ========================
			-- 1. Handshake Preparation (tell the lsp what feature nvim+plugins supports)
			-- ========================
			-- this merges default nvim capabilities with those required by nvim-cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()                                 -- native nvim capabilities
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities()) -- add cmp capabilities to the native ones

			-- ==========================
			-- 2. list servers & settings
			-- ==========================
			-- These have to be installed with Mason as well
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
						},
					},
				},
				gopls = {
					settings = {
						gopls = {},
					},
				},
			}

			-- ==========================
			-- 3. Setup Mason-LSPConfig
			-- ==========================
			-- Takes the list of servers and turns them on.
			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				handlers = {
					function(server_name)
						local server_config = servers[server_name] or {}
						server_config.capabilities =
							vim.tbl_deep_extend("force", {}, capabilities, server_config.capabilities or {})
						require("lspconfig")[server_name].setup(server_config)
					end,
				},
			})

			-- ======================================
			-- 4. Start and connect to LSP + Keybinds
			-- ======================================
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),

				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)

					if client and client.server_capabilities.documentFormattingProvider then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = event.buf,
							callback = function()
								vim.lsp.buf.format({ async = false, id = client.id })
							end,
						})
					end
				end,
			})
		end,
	},
}
