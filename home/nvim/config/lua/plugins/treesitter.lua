return { -- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"comment",
				"css",
				"cue",
				"diff",
				"dockerfile",
				"elm",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gotmpl",
				"gomod",
				"gosum",
				"gowork",
				"graphql",
				"haskell",
				"hcl",
				"helm",
				"html",
				"ini",
				"javascript",
				"jq",
				"json",
				"just",
				"lua",
				"luadoc",
				"make",
				"nix",
				"php",
				"promql",
				"proto",
				"python",
				"rust",
				"regex",
				"scss",
				"sql",
				"svelte",
				"terraform",
				"tmux",
				"toml",
				"tsv",
				"twig",
				"typescript",
				"vim",
				"xml",
				"yaml",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["am"] = "@function.outer",
						["im"] = "@function.inner",
						["af"] = "@call.outer",
						["if"] = "@call.inner",
						["ai"] = "@conditional.outer",
						["ii"] = "@conditional.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["ap"] = "@parameter.outer",
						["ip"] = "@parameter.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
						["a/"] = "@comment.outer",
						["i/"] = "@comment.inner",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>sp"] = "@parameter.inner",
						["<leader>sm"] = "@function.outer",
					},
					swap_previous = {
						["<leader>sP"] = "@parameter.inner",
						["<leader>sM"] = "@function.outer",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = { query = "@function.outer", desc = "Next function start" },
						["]f"] = { query = "@call.outer", desc = "Next call start" },
						["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
						["]c"] = { query = "@class.outer", desc = "Next class start" },
						["]p"] = { query = "@parameter.outer", desc = "Next parameter start" },
						["]l"] = { query = "@loop.outer", desc = "Next loop start" },
						["]/"] = { query = "@comment.outer", desc = "Next comment start" },
					},
					goto_next_end = {
						["]M"] = { query = "@function.outer", desc = "Next function end" },
						["]F"] = { query = "@call.outer", desc = "Next call end" },
						["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
						["]C"] = { query = "@class.outer", desc = "Next class end" },
						["]P"] = { query = "@parameter.outer", desc = "Next parameter end" },
						["]L"] = { query = "@loop.outer", desc = "Next loop end" },
						["]/"] = { query = "@comment.outer", desc = "Next comment end" },
					},
					goto_previous_start = {
						["[m"] = { query = "@function.outer", desc = "Prev function start" },
						["[f"] = { query = "@call.outer", desc = "Prev call start" },
						["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
						["[c"] = { query = "@class.outer", desc = "Prev class start" },
						["[p"] = { query = "@parameter.outer", desc = "Prev parameter start" },
						["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
						["[/"] = { query = "@comment.outer", desc = "Prev comment start" },
					},
					goto_previous_end = {
						["[M"] = { query = "@function.outer", desc = "Prev function end" },
						["[F"] = { query = "@call.outer", desc = "Prev call end" },
						["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
						["[C"] = { query = "@class.outer", desc = "Prev class end" },
						["[P"] = { query = "@parameter.outer", desc = "Prev parameter end" },
						["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
						["[/"] = { query = "@comment.outer", desc = "Prev comment end" },
					},
				},

			},
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
			-- vim way: ; goes to the direction you were moving.
			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
			vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

			-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
			vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
			vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
			vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
			vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
		end,
	},
}
