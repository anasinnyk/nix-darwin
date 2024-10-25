return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio"
		},
		config = function()
			require("dapui").setup()
			require("nvim-dap-virtual-text").setup()
			require("dap-go").setup()
		end,
	}
}
