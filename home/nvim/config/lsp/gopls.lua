return {
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.mod", "go.work" },
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
}
