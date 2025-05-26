return {
	'Saghen/blink.cmp',
	dependencies = {
		'rafamadriz/friendly-snippets',
		'Kaiser-Yang/blink-cmp-avante',
		'fang2hou/blink-copilot',
		'kristijanhusak/vim-dadbod-completion',
		'folke/lazydev.nvim',
		'mrcjkb/haskell-snippets.nvim',
		"L3MON4D3/LuaSnip",
	},
	build = 'nix run .#build-plugin',
	-- config = function()
	-- 	local ls = require('luasnip')
	-- 	local hs_snip = require('haskell-snippets').all
	-- 	ls.add_snippets('haskell', hs_snip, { key = 'haskell' })
	-- end,
	opts = {
		keymap = { preset = 'default' },
		snippets = { preset = 'luasnip' },
		appearance = {
			nerd_font_variant = 'mono'
		},
		signature = { enabled = true },
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer', 'avante' },
			per_filetype = {
				lua = { inherit_defaults = true, 'lazydev' },
				sql = { inherit_defaults = true, 'dadbod' },
			},
			providers = {
				lsp = { module = 'blink.cmp.sources.lsp', name = 'LSP', score_offset = 100 },
				dadbod = { module = 'vim_dadbod_completion.blink', name = 'DadBoD', score_offset = 100 },
				copilot = { module = 'blink-copilot', name = 'Copilot', score_offset = 1 },
				avante = { module = 'blink-cmp-avante', name = 'Avante' },
				lazydev = { module = 'lazydev.integrations.blink', name = 'LazyDev', score_offset = 100 },
				k
			}
		},
	},
}
