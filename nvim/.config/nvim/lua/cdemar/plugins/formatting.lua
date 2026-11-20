-- Format on save. Markdown is left out on purpose so notes are never rewritten.
return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>mp",
			function()
				require("conform").format({ lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
			desc = "Format files or selection",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_organize_imports", "ruff_format" },
			sh = { "shfmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
		},
		format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
	},
}
