return {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VimEnter",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		commands = {
			avante_add_files = function(state)
				local node = state.tree:get_node()
				local filepath = node:get_id()
				local relative_path = require('avante.utils').relative_path(filepath)

				local sidebar = require('avante').get()

				local open = sidebar:is_open()
				-- ensure avante sidebar is open
				if not open then
					require('avante.api').ask()
					sidebar = require('avante').get()
				end

				sidebar.file_selector:add_selected_file(relative_path)

				if not open then
					sidebar.file_selector:remove_selected_file('neo-tree filesystem [1]')
				end
			end,
			grug_far_replace = function(state)
				local node = state.tree:get_node()
				local prefills = {
					paths = node.type == "directory" and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":p"))
							or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":h")),
				}
				local grug_far = require("grug-far")

				if not grug_far.has_instance("explorer") then
					grug_far.open({ instanceName = "explorer" })
				else
					grug_far.open_instance("explorer")
				end
				-- doing it seperately because multiple paths doesn't open work when passed with open
				-- updating the prefills without clearing the search and other fields
				grug_far.update_instance_prefills("explorer", prefills, false)
			end,
			copy_selector = function(state)
				local node = state.tree:get_node()
				local filepath = node:get_id()
				local filename = node.name
				local modify = vim.fn.fnamemodify

				local vals = {
					["BASENAME"] = modify(filename, ":r"),
					["EXTENSION"] = modify(filename, ":e"),
					["FILENAME"] = filename,
					["PATH (CWD)"] = modify(filepath, ":."),
					["PATH (HOME)"] = modify(filepath, ":~"),
					["PATH"] = filepath,
					["URI"] = vim.uri_from_fname(filepath),
				}

				local options = vim.tbl_filter(
					function(val)
						return vals[val] ~= ""
					end,
					vim.tbl_keys(vals)
				)
				if vim.tbl_isempty(options) then
					vim.notify("No values to copy", vim.log.levels.WARN)
					return
				end
				table.sort(options)
				vim.ui.select(options, {
					prompt = "Choose to copy to clipboard:",
					format_item = function(item)
						return ("%s: %s"):format(item, vals[item])
					end,
				}, function(choice)
					local result = vals[choice]
					if result then
						vim.notify(("Copied: `%s`"):format(result))
						vim.fn.setreg("+", result)
					end
				end)
			end,
		},
		window = {
			mappings = {
				Y = "copy_selector",
				['oa'] = "avante_add_files",
				['F'] = "grug_far_replace",
			},
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function(file_path)
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
	keys = {
		{
			"<leader>tt",
			"<cmd>Neotree toggle<cr>",
			desc = "[T]oggle Neo[t]ree",
		},
	},
}
