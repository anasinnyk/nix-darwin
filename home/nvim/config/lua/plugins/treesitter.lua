return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"comment",
			"css",
			"cue",
			"diff",
			"dockerfile",
			"elm",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"go",
			"gotmpl",
			"gomod",
			"gosum",
			"gowork",
			"graphql",
			"haskell",
			"hcl",
			"helm",
			"html",
			"ini",
			"javascript",
			"jq",
			"json",
			"just",
			"lua",
			"luadoc",
			"make",
			"nix",
			"php",
			"promql",
			"proto",
			"python",
			"rust",
			"regex",
			"scss",
			"sql",
			"svelte",
			"terraform",
			"tmux",
			"toml",
			"tsv",
			"twig",
			"typescript",
			"vim",
			"xml",
			"yaml",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.install").prefer_git = true
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)
	end,
}
