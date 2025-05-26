return {
	"anasinnyk/nvim-k8s-crd",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require('nvim-k8s-crd').setup({})
	end
}
