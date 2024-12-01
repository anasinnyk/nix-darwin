return {
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})

			require("which-key").add({
				{ "<leader>l",  group = "LSP" },
				{ "<leader>lc", "<cmd>Lspsaga code_action<cr>",                desc = "Code Action" },
				{ "<leader>lo", "<cmd>Lspsaga outline<cr>",                    desc = "Outline" },
				{ "<leader>lr", "<cmd>Lspsaga rename<cr>",                     desc = "Rename" },
				{ "<leader>ld", "<cmd>Lspsaga goto_definition<cr>",            desc = "Lsp GoTo Definition" },
				{ "<leader>lf", "<cmd>Lspsaga finder<cr>",                     desc = "Lsp Finder" },
				{ "<leader>lp", "<cmd>Lspsaga preview_definition<cr>",         desc = "Preview Definition" },
				{ "<leader>ls", "<cmd>Lspsaga signature_help<cr>",             desc = "Signature Help" },
				{ "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<cr>", desc = "Show Workspace Diagnostics" },
			})
		end,
		dependencies = {
			"folke/which-key.nvim",
			'nvim-treesitter/nvim-treesitter', -- optional
			'nvim-tree/nvim-web-devicons',  -- optional
		}
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({
				mode = 'symbol_text',

				preset = 'codicons',

				symbol_map = {
					Text = "󰉿",
					Method = "󰆧",
					Function = "󰊕",
					Constructor = "",
					Field = "󰜢",
					Variable = "󰀫",
					Class = "󰠱",
					Interface = "",
					Module = "",
					Property = "󰜢",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "",
					Keyword = "󰌋",
					Snippet = "",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "",
					Operator = "󰆕",
					TypeParameter = "",
					Copilot = "",
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_cmp()

			local cmp = require('cmp')
			local cmp_action = lsp_zero.cmp_action()

			local has_words_before = function()
				if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
			end

			cmp.setup({
				formatting = lsp_zero.cmp_format({ details = true }),
				sources = {
					-- SQL Dadbod
					{ name = 'vim-dadbod-completion' },
					-- Copilot Source
					{ name = "copilot",              group_index = 2 },
					-- Other Sources
					{ name = "nvim_lsp",             group_index = 1 },
					{ name = "path",                 group_index = 3 },
					{ name = "buffer",               group_index = 3 },
				},
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
					['<C-f>'] = cmp_action.luasnip_jump_forward(),
					['<C-b>'] = cmp_action.luasnip_jump_backward(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = vim.schedule_wrap(function(fallback)
						if cmp.visible() and has_words_before() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end),
				}),
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
			})
		end,
	},
	{
		'neovim/nvim-lspconfig',
		cmd = 'LspInfo',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
		},
		config = function()
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({
					buffer = bufnr,
					preserve_mappings = false,
				})
				lsp_zero.buffer_autoformat()
			end)

			lsp_zero.format_on_save({
				format_opts = {
					async = false,
					timeout_ms = 10000,
				},
				servers = {
					['rust_analyzer'] = { 'rust' },
					['gopls'] = { 'go', 'gomod', 'gowork', 'gotmpl' },
					['yamlls'] = { 'yaml', 'json' },
				}
			})

			local util = require("lspconfig/util")
			require("lspconfig").gopls.setup({
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.mod", "go.work"),
				settings = {
					gopls = {
						analyses = {
							completeUnimported = true,
							usePlaceholders = true,
							unusedparams = true,
							unusedvariable = true,
							shadow = true,
						},
					},
				},
			})
			require("lspconfig").rust_analyzer.setup({
				filetypes = { "rust" },
				root_dir = util.root_pattern("Cargo.toml"),
				settings = {
					["rust_analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})
			require("lspconfig").sourcekit.setup({
				filetypes = { "swift" },
			})

			require("lspconfig").yamlls.setup({
				filetypes = { "yaml", "json" },
				settings = {
					yaml = {
						schemaDownload = {
							enable = true,
						},
						validate = true,
						schemas = {
							['https://json.schemastore.org/kustomization.json'] = 'kustomization.{yml,yaml}',
							["https://json.schemastore.org/github-workflow"] = ".github/workflows/*",
							["https://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
							kubernetes = "*.yaml"
						},
						format = {
							enable = true,
						},
						hover = true,
						completion = true,
					},
				},
			})

			require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls())
		end
	},
	{
		"anasinnyk/nvim-k8s-crd",
		event = { "BufEnter *.yaml" },
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("k8s-crd").setup()
		end,
	},
	{
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
	},
	{
		'kristijanhusak/vim-dadbod-ui',
		dependencies = {
			{ 'tpope/vim-dadbod',                     lazy = true },
			{ 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
		},
		cmd = {
			'DBUI',
			'DBUIToggle',
			'DBUIAddConnection',
			'DBUIFindBuffer',
		},
		keys = {
			{ '<leader>td', '<cmd>DBUIToggle<cr>', desc = '[T]oggle [D]atabases' },
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
