return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	keys = {
		{
			"<leader>tf",
			function()
				local bufnr = vim.api.nvim_get_current_buf()
				vim.b[bufnr].disable_autoformat = not vim.b[bufnr].disable_autoformat
			end,
			desc = "[T]oggle LSP [F]ormat buffer",
		},
		{
			"<leader>tF",
			function()
				vim.g.disable_autoformat = not vim.g.disable_autoformat
			end,
			desc = "[T]oggle LSP [F]ormat global",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return nil
			end
			return {
				timeout_ms = 300,
				lsp_fallback = true,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
		},
	},
}
