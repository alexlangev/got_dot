return {
	{
		-- main lsp plugin
		"neovim/nvim-lspconfig",
		dependencies = {
			-- an lsp manager, type :Mason
			"mason-org/mason.nvim",

			-- the bridge between Mason and lspconfig
			"mason-org/mason-lspconfig.nvim",

			-- a set of lua specific configs for neovim files
			"folke/lazydev.nvim",
		},

		config = function()
			require("lazydev").setup() -- this one must be called first for some reason...
			require("mason").setup()

			require("mason-lspconfig").setup({
				-- A list of servers to automatically install if they're not already installed
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
				automatic_enable = true,
			})

			-- diagnostics
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					border = "single",
					source = true,
				},
			})

			-- leader sd to show diagnostic float
			vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, { desc = "Show diagnostic" })
			vim.keymap.set("n", "dp", function()
				vim.diagnostic.jump({ count = -1 })
			end, { desc = "Go to previous diagnostic" })
			vim.keymap.set("n", "dn", function()
				vim.diagnostic.jump({ count = 1 })
			end, { desc = "Go to next diagnostic" })

			-- Auto-show diagnostics on hover
			-- vim.api.nvim_create_autocmd("CursorHold", {
			-- 	callback = function()
			-- 		vim.diagnostic.open_float(nil, { focus = false })
			-- 	end,
			-- })
			--
			--
			-- Add this here for signature help border
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "single",
			})

			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						gofumpt = true,
						completeUnimported = true,
						analyses = {
							unusedparams = true,
						},
					},
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

			vim.lsp.config("jsonls", {
				settings = {
					json = {
						format = {
							enable = true,
						},
						validate = {
							enable = true,
						},
						schemaDownload = {
							enable = true,
						},
					},
				},
			})

			vim.lsp.config("marksman", {
				-- doesnt use settings, it uses init_options
			})

			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnoticMode = "workspace",
							useLibraryjcodeForTypes = true,
							typeCheckingMode = "basic",
						},
					},
				},
			})

			vim.lsp.config("solidity", {
				-- defaults are fine
				-- configs are done via remappings in
				-- foundry.toml and hardhat.config.js
			})

			vim.lsp.config("ts_ls", {
				settings = {
					typescript = {
						-- TODO
					},
					javascript = {
						-- TODO
					},
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "gofumpt", "goimports" },
					json = { "prettier" },
					python = { "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "1.*",
		dependencies = {
			"L3MON4D3/LuaSnip",
			version = "2.*",
		},
		opts = {
			keymap = {
				preset = "default",
				["<C-l>"] = { "show_documentation", "hide_documentation" }, -- Ctrl-l to toggle docs
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				menu = {
					border = "none",
				},
				documentation = {
					auto_show = false,
					auto_show_delay_ms = 500,
					window = {
						border = "single",
					},
				},
			},
			sources = {
				-- can add luasnip and dadbod here
				default = { "lsp", "path", "snippets", "buffer" },
			},
			snippets = {
				preset = "luasnip",
			},
		},
	},
}
