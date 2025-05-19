return {
	"anasinnyk/nvim-k8s-crd",
	event = { "BufEnter *.yaml" },
	branch = "chek-nvim-11",
	config = function()
		require('nvim-k8s-crd').setup({})
	end
}
