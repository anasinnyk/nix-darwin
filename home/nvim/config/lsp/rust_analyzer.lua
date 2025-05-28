return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml" },
	settings = {
		["rust_analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			completion = {
				snippets = 'add_parenthesis'
			},
		},
	},
}
