return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local b = null_ls.builtins
		null_ls.setup({
			root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				b.completion.spell,
				b.code_actions.gitsigns,
				b.code_actions.shellcheck,
				b.formatting.prettier,
				b.formatting.shfmt,
				b.formatting.stylua,
				b.diagnostics.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc.js" })
					end,
				}),
			},
		})
	end,
}
