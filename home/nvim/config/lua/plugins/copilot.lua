return {
	"zbirenbaum/copilot-cmp",
	event = { "InsertEnter", "LspAttach" },
	fix_pairs = true,
	dependencies = {
		"zbirenbaum/copilot.lua",
		"github/copilot.vim",
	},
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
		vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#000000" })
		require("copilot").setup({})
		require("copilot_cmp").setup()
	end,
}
