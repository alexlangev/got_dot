-- set <space> as the leader key
-- always set this first
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- turn off swapfile
vim.opt.swapfile = false

-- set true if using nerd font
vim.g.have_nerd_font = false

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- mouse support for resizing splits
vim.o.mouse = "a"

-- mode is shown is status bar anyways
vim.o.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- default tabs (style when starting new file)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Not sure, it this the left gutter?
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence time cuz coffee
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display whitespaces and stuff
-- vim.o.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on!
vim.o.cursorline = true

-- keep eyes centered
vim.o.scrolloff = 8

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Clear highlights on search with <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostics keybind... ?
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Visual feedback on yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- highlight group colors?
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "MiniCursorword", {
			underline = true,
		})
		vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", {
			bg = "NONE",
			fg = "NONE",
			bold = false,
			italic = false,
			underline = true,
		})
	end,
})

-- plugin manager
require("config.lazy")
