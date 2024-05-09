return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.background = "light"
		vim.cmd([[colorscheme gruvbox]])
	end,
}
