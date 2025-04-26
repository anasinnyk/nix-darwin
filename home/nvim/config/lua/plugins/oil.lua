return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require "oil"
		oil.setup {
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
