return {
	"romgrk/barbar.nvim",
	event = "BufEnter",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	keys = {
		{ "<A-,>",      "<Cmd>BufferPrevious<CR>",            { desc = "Go to previous buffer" } },
		{ "<A-.>",      "<Cmd>BufferNext<CR>",                { desc = "Go to next buffer" } },
		{ "<A-<>",      "<Cmd>BufferMovePrevious<CR>",        { desc = "Move to next buffer" } },
		{ "<A->>",      "<Cmd>BufferMoveNext<CR>",            { desc = "Move to next buffer" } },
		{ "<A-1>",      "<Cmd>BufferGoto 1<CR>",              { desc = "Go to 1st buffer" } },
		{ "<A-2>",      "<Cmd>BufferGoto 2<CR>",              { desc = "Go to 2nd buffer" } },
		{ "<A-3>",      "<Cmd>BufferGoto 3<CR>",              { desc = "Go to 3rd buffer" } },
		{ "<A-4>",      "<Cmd>BufferGoto 4<CR>",              { desc = "Go to 4th buffer" } },
		{ "<A-5>",      "<Cmd>BufferGoto 5<CR>",              { desc = "Go to 5th buffer" } },
		{ "<A-6>",      "<Cmd>BufferGoto 6<CR>",              { desc = "Go to 6th buffer" } },
		{ "<A-7>",      "<Cmd>BufferGoto 7<CR>",              { desc = "Go to 7th buffer" } },
		{ "<A-8>",      "<Cmd>BufferGoto 8<CR>",              { desc = "Go to 8th buffer" } },
		{ "<A-9>",      "<Cmd>BufferGoto 9<CR>",              { desc = "Go to 9th buffer" } },
		{ "<A-0>",      "<Cmd>BufferLast<CR>",                { desc = "Go to last buffer" } },
		{ "<A-p>",      "<Cmd>BufferPin<CR>",                 { desc = "Pin buffer" } },
		{ "<A-C>",      "<Cmd>BufferRestore<CR>",             { desc = "Restore buffer" } },
		{ "<A-c>",      "<Cmd>BufferClose<CR>",               { desc = "Close buffer" } },
		{ "<leader>bc", "<Cmd>BufferCloseAllButCurrent<CR>",  { desc = "[B]uffers [c]lose but [c]urrent" } },
		{ "<leader>bp", "<Cmd>BufferCloseAllButPinned<CR>",   { desc = "[B]uffers [c]lose but [p]ined" } },
		{ "<leader>bl", "<Cmd>BufferCloseBuffersLeft<CR>",    { desc = "[B]uffers [c]lose [l]eft" } },
		{ "<leader>br", "<Cmd>BufferCloseBuffersRight<CR>",   { desc = "[B]uffers [c]lose [r]ight" } },
		{ "<leader>bn", "<Cmd>BufferOrderByBufferNumber<CR>", { desc = "[B]uffers [o]rder by [b]uffer number" } },
		{ "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>",    { desc = "[B]uffers [o]rder by [d]irectory" } },
		{ "<leader>bL", "<Cmd>BufferOrderByLanguage<CR>",     { desc = "[B]uffers [o]rder by [l]anguage" } },
	},
	opts = {},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
