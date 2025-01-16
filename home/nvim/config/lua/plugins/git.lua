return {
	{
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
	},
	{
		"lewis6991/gitsigns.nvim", -- Adds git related signs to the gutter, as well as utilities for managing changes
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		'pwntester/octo.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			-- OR 'ibhagwan/fzf-lua',
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require "octo".setup({
				mappings_disable_default = false,
			})
		end
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "[G]o to Lazy[G]it" },
		},
	},
	{ "sindrets/diffview.nvim" }
}
