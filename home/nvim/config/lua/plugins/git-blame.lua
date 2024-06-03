return {
	"f-person/git-blame.nvim",
	event = { 'BufReadPre', 'BufNewFile' },
	keys = {
		{
			"<leader>tb",
			"<cmd>GitBlameToggle<cr>",
			desc = "[T]oggle Git [B]lame",
		},
		{
			"<leader>go",
			"<cmd>GitBlameOpenCommitURL<cr>",
			desc = "[G]it [O]pen Commit URL",
		},
	},
}
