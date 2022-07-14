local null_ls = require("null-ls")
local b = null_ls.builtins

require("null-ls").setup({
	sources = {
		b.formatting.prettier,
		b.formatting.shfmt,
		b.formatting.stylua,
		b.diagnostics.eslint_d,
		b.completion.spell,
		b.code_actions.gitsigns,
		b.code_actions.shellcheck,
	},
})
