return {
	"folke/which-key.nvim", -- Useful plugin to show you pending keybinds.
	event = "VimEnter",
	config = function()
		require("which-key").setup()

		require("which-key").register({
			["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
			["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
			["<leader>l"] = { name = "[L]SP", _ = "which_key_ignore" },
			["<leader>b"] = { name = "[B]uffer", _ = "which_key_ignore" },
			["<leader>c"] = { name = "[C]hat GPT", _ = "which_key_ignore" },
			["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
			["<leader>k"] = { name = "[K]ustomize", _ = "which_key_ignore" },
			["<leader>kf"] = { name = "[K]ustomize [F]lux", _ = "which_key_ignore" },
		})
	end,
}
