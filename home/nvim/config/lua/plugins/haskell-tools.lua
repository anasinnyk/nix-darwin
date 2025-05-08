return {
	'mrcjkb/haskell-tools.nvim',
	lazy = false,
	dependencies = {
		{ 'kevinhwang91/nvim-ufo', lazy = true },
		{ 'Vigemus/iron.nvim',     lazy = true },
	},
	version = '^6',
	init = function()
		vim.g.haskell_tools = {
			hls = {
				on_attach = function(client, bufnr, ht)
					vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run,
						{ desc = 'Code Lens', noremap = true, silent = true, buffer = bufnr });
					vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature,
						{ desc = 'Hoogle Signature', noremap = true, silent = true, buffer = bufnr });
					vim.keymap.set('n', '<leader>ea', ht.lsp.buf_eval_all,
						{ desc = 'Evaluate All', noremap = true, silent = true, buffer = bufnr });
					vim.keymap.set('n', '<leader>rr', ht.repl.toggle,
						{ desc = 'Toggle Repl Package', noremap = true, silent = true, buffer = bufnr });
					vim.keymap.set('n', '<leader>rf', function() ht.repl.toggle(vim.api.nvim_buf_get_name(0)) end,
						{ desc = 'Toggle Repl Buffer', noremap = true, silent = true, buffer = bufnr });
					vim.keymap.set('n', '<leader>rq', ht.repl.quit,
						{ desc = 'Quit Repl', noremap = true, silent = true, buffer = bufnr });
				end
			}
		}
	end,
}
