vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.colorcolumn = { 121 }

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamed"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps:
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "Save/[W]rite buffer" })
vim.keymap.set("n", "<leader>q", ":q<cr>", { desc = "[Q]uit" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Scrolling
-- vim.keymap.set("n", "m", "<C-d>")
-- vim.keymap.set("n", ",", "<C-u>")
-- Redo
vim.keymap.set("n", "U", "<C-r>")

-- close buffers
vim.keymap.set("n", "<leader>x", ":bp| bd #<CR>", { desc = "[X] Close buffer" })
-- close all buffers except the current one
vim.keymap.set("n", "<leader>X", function()
	local cur = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= cur and vim.api.nvim_buf_is_loaded(buf) then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end, { desc = "[X] Close all other buffers" })

vim.keymap.set("n", "<leader><CR>", function()
	require('telescope.builtin').buffers({
		sort_lastused = true,
		sort_mru = true,
		ignore_current_buffer = false,
		previewer = true,
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.9,
			preview_cutoff = 120,
			prompt_position = "top",
		},
	})
end, { desc = "Telescope: Buffers with Preview" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
--
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-M-s>", "<cmd>vert res +3<cr>", { desc = "Resize window left " })
vim.keymap.set("n", "<C-M-g>", "<cmd>vert res -3<cr>", { desc = "Resize window right" })
vim.keymap.set("n", "<C-M-d>", "<cmd>res -3<cr>", { desc = "Resize window up" })
vim.keymap.set("n", "<C-M-f>", "<cmd>res +3<cr>", { desc = "Resize window down" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<leader>kfb", function()
	local bf = vim.fn.expand('%')
	vim.cmd("vnew")
	vim.cmd("setlocal buftype=nofile")
	vim.cmd(string.format(
		"execute 'r !flux build ks $(cat %s | yq -r \".metadata.name\") --kustomization-file %s --path $(cat %s | yq -r \".spec.path\")'",
		bf, bf, bf))
	vim.cmd("setlocal filetype=yaml")
	vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>bd!<CR>", { noremap = true, silent = true })
end, { desc = "[K]ustomize [F]lux [B]uild" })

vim.keymap.set("n", "<leader>kfd", function()
	local bf = vim.fn.expand('%')
	vim.cmd("new")
	vim.cmd("setlocal buftype=nofile")
	vim.cmd(string.format(
		"execute 'r !flux diff ks $(cat %s | yq -r \".metadata.name\") --kustomization-file %s --path $(cat %s | yq -r \".spec.path\")'",
		bf, bf, bf))
	vim.cmd("setlocal filetype=yaml")
	vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>bd!<CR>", { noremap = true, silent = true })
end, { desc = "[K]ustomize [F]lux [D]iff" })
