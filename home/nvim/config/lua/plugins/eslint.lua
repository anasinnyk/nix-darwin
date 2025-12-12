return {
	'esmuellert/nvim-eslint',
	config = function()
		require('nvim-eslint').setup({})
	end,
	settings = {
		format = true,
	},
}
