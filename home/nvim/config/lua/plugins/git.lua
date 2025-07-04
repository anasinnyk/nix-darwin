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
		},
		config = function()
			require "octo".setup({
				mappings_disable_default = false,
				default_merge_method = "squash",
				default_delete_branch = true,
			})
		end,
		keys = {
			{ "<leader>gO", "<cmd>Octo pr list<cr>",         desc = "[G]it [O]cto PR" },
			{ "<leader>gP", "<cmd>Octo pr view<cr>",         desc = "[G]it [P]ull Request" },
			{ "<leader>gC", "<cmd>Octo pr create draft<cr>", desc = "[G]it Pull Request [C]reate" },
			{ "<leader>gR", "<cmd>Octo pr ready<cr>",        desc = "[G]it Pull Request [R]eady" },
		},
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
	{ "sindrets/diffview.nvim" },
}
