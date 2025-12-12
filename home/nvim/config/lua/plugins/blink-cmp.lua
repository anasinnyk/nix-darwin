return {
	'Saghen/blink.cmp',
	dependencies = {
		'rafamadriz/friendly-snippets',
		'kristijanhusak/vim-dadbod-completion',
		'folke/lazydev.nvim',
		'mrcjkb/haskell-snippets.nvim',
		"L3MON4D3/LuaSnip",
	},
	version = '1.*',
	config = function(_, opts)
		local blink_cmp = require("blink.cmp")
		local ls = require("luasnip")

		blink_cmp.setup(opts)

		require("luasnip.loaders.from_vscode").lazy_load()

		local hs_snip = require("haskell-snippets").all
		ls.add_snippets("haskell", hs_snip, { key = "haskell" })
	end,
	opts = {
		keymap = {
			preset = 'default',
		},
		snippets = { preset = 'luasnip' },
		appearance = {
			nerd_font_variant = 'mono'
		},
		signature = { enabled = true },
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
			per_filetype = {
				lua = { inherit_defaults = true, 'lazydev' },
				sql = { inherit_defaults = true, 'dadbod' },
			},
			providers = {
				lsp = { module = 'blink.cmp.sources.lsp', name = 'LSP', score_offset = 100 },
				dadbod = { module = 'vim_dadbod_completion.blink', name = 'DadBoD', score_offset = 100 },
				lazydev = { module = 'lazydev.integrations.blink', name = 'LazyDev', score_offset = 100 },
			}
		},
	},
}
