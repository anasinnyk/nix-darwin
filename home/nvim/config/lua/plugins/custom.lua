return {
	"tpope/vim-sleuth", -- check .editorconfig
	{
		"numToStr/Comment.nvim",
		opts = {},
		config = function()
			vim.keymap.set("n", "<leader>/", function()
				return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)"
					or "<Plug>(comment_toggle_linewise_count)"
			end, { expr = true, desc = "Comment current code line(s)" })
			vim.keymap.set("x", "<leader>/", function()
				print(vim.fn.visualmode())
				print(vim.fn.visualmode())
				return vim.fn.visualmode() == "V"
						and '<ESC><CMD>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<CR>'
					or '<ESC><CMD>lua require("Comment.api").locked("toggle.blockwise")(vim.fn.visualmode())<CR>'
			end, { expr = true, desc = "(Un)Comment current code line/block" })
		end,
	}, -- "gc" to comment visual regions/lines
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		main = "ibl",
		opts = {},
	},
}
