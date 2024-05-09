return {
	"tpope/vim-sleuth", -- check .editorconfig
	{ "numToStr/Comment.nvim", opts = {} }, -- "gc" to comment visual regions/lines
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		main = "ibl",
		opts = {
		},
	},
}
