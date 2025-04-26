return {
	"folke/which-key.nvim", -- Useful plugin to show you pending keybinds.
	event = "VimEnter",
	config = function()
		require("which-key").setup()

		require("which-key").add({
			{ "<leader>a",  group = "[A]vante" },
			{ "<leader>f",  group = "[F]ind" },
			{ "<leader>t",  group = "[T]oggle" },
			{ "<leader>l",  group = "[L]SP" },
			{ "<leader>b",  group = "[B]uffer" },
			{ "<leader>g",  group = "[G]it" },
			{ "<leader>k",  group = "[K]ustomize" },
			{ "<leader>kf", group = "[K]ustomize [F]lux" },
			{ "<leader>r",  group = "HTTP [R]equest" },
		})
	end,
}
