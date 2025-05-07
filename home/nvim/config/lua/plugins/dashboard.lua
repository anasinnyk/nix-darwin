return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local function is_macpaw_repo()
			local handle = io.popen("git remote get-url origin")
			if handle == nil then
				return false
			end
			local result = handle:read("*a")
			handle:close()
			return string.find(result, "macpaw") and true or false
		end

		require("dashboard").setup({
			config = {
				shortcut = {
					{
						icon = "󰈞 ",
						icon_hl = "@variable",
						desc = "Find Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Oil Open",
						group = "Label",
						action = "Oil",
						key = "t",
					},
				},
				header = vim.split(is_macpaw_repo() and [[
███╗   ███╗ █████╗  ██████╗██████╗  █████╗ ██╗    ██╗
████╗ ████║██╔══██╗██╔════╝██╔══██╗██╔══██╗██║    ██║
██╔████╔██║███████║██║     ██████╔╝███████║██║ █╗ ██║
██║╚██╔╝██║██╔══██║██║     ██╔═══╝ ██╔══██║██║███╗██║
██║ ╚═╝ ██║██║  ██║╚██████╗██║     ██║  ██║╚███╔███╔╝
╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝     ╚═╝  ╚═╝ ╚══╝╚══╝
					]] or [[
	███╗   ██╗ █████╗ ███████╗ ██╗██╗  ██╗
	████╗  ██║██╔══██╗██╔════╝███║██║ ██╔╝
	██╔██╗ ██║███████║███████╗╚██║█████╔╝
██║╚██╗██║██╔══██║╚════██║ ██║██╔═██╗
	██║ ╚████║██║  ██║███████║ ██║██║  ██╗
	╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝ ╚═╝╚═╝  ╚═╝
					]], "\n"),
			},
		})
	end,
}
