return {
	"anasinnyk/nvim-k8s-crd",
	event = { "BufEnter *.yaml" },
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		require('nvim-k8s-crd').setup({})
	end
}
