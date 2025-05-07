return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local oil = require "oil"
		oil.setup {
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					return name == ".git"
							or name == ".devenv"
							or name == ".DS_Store"
							or name == ".k8s-schemas"
							or name == ".."
				end
			},
			keymaps = {
				-- create a new mapping, gs, to search and replace in the current directory
				gs = {
					callback = function()
						local prefills = { paths = oil.get_current_dir() }

						local grug_far = require "grug-far"
						if not grug_far.has_instance "explorer" then
							grug_far.open {
								instanceName = "explorer",
								prefills = prefills,
								staticTitle = "Find and Replace from Explorer",
							}
						else
							grug_far.open_instance "explorer"
							grug_far.update_instance_prefills("explorer", prefills, false)
						end
					end,
					desc = "oil: Search in directory",
				},
			},
		}
	end,
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
}
