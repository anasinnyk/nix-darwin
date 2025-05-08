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
	-- config = function()
	-- 	local ls = require('luasnip')
	-- 	local hs_snip = require('haskell-snippets').all
	-- 	ls.add_snippets('haskell', hs_snip, { key = 'haskell' })
	-- end,
	opts = {
		keymap = { preset = 'default' },
		snippets = { preset = 'luasnip' },
		apperence = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = 'mono',
		},
		singnature = {
			enable = true,
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot', 'avante' },
			lua = { inherit_defaults = true, 'lazydev' },
			sql = { inherit_defaults = true, 'dadbod' },

			providers = {
				dadbod = { module = 'vim_dadbod_completion.blink' },
				copilot = { module = 'blink-copilot', name = 'Copilot' },
				avante = { module = 'blink-cmp-avante', name = 'Avante' },
				lazydev = { module = 'lazydev' },
			}
		},
		fuzzy = { implementation = "lua" },
	},
}
