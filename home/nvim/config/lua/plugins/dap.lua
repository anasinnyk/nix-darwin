return {
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'leoluz/nvim-dap-go',
			'theHamsta/nvim-dap-virtual-text',
			'rcarriga/nvim-dap-ui',
			'nvim-neotest/nvim-nio'
		},
		config = function()
			local dap = require('dap')
			local ui = require('dapui')
			ui.setup()
			require('nvim-dap-virtual-text').setup()
			require('dap-go').setup()
			vim.keymap.set('n', '<leader>du', require('dapui').toggle, { desc = 'Toggle DAP UI' })
			vim.keymap.set('n', '<leader>dU', require('dap').repl.toggle, { desc = 'Toggle DAP REPL' })
			vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint, { desc = 'Toggle DAP Breakpoint' })
			vim.keymap.set('n', '<leader>dB', require('dap').clear_breakpoints, { desc = 'Clear DAP Breakpoints' })
			vim.keymap.set('n', '<leader><C-b>',
				function() require('dap').toggle_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
				{ desc = 'Toggle DAP Breakpoint with Condition' })
			vim.keymap.set('n', '<leader>dk', require('dap').close, { desc = 'Terminate DAP Session' })
			vim.keymap.set('n', '<leader>dc', require('dap').continue, { desc = 'Continue DAP Session' })
			vim.keymap.set('n', '<leader>dC', require('dap').run_to_cursor, { desc = 'Run to Cursor in DAP Session' })
			vim.keymap.set('n', '<leader>di', require('dap').step_into, { desc = 'Step Into DAP Session' })
			vim.keymap.set('n', '<leader>do', require('dap').step_over, { desc = 'Step Over DAP Session' })
			vim.keymap.set('n', '<leader>dO', require('dap').step_out, { desc = 'Step Out of DAP Session' })
			vim.keymap.set('n', '<leader>de', require('dapui').eval, { desc = 'Evaluate Expression in DAP' })

			vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
			vim.fn.sign_define('DapBreakpointCondition', { text = '🟡', texthl = '', linehl = '', numhl = '' })
			vim.fn.sign_define('DapBreakpointRejected', { text = '⭕', texthl = '', linehl = '', numhl = '' })
			vim.fn.sign_define('DapLogPoint', { text = '🔵', texthl = '', linehl = '', numhl = '' })
			vim.fn.sign_define('DapStopped', { text = '🟢', texthl = '', linehl = '', numhl = '' })

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end
	}
}
