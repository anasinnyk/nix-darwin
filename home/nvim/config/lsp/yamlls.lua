return {
	cmd = { 'yaml-language-server' },
	filetypes = { 'yaml', 'json' },
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
}
