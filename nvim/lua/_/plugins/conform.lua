return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				sh = { "shfmt" },
				zsh = { "shfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
			},
		})

		local k = require("_.lib.k")
		k({ "n", "v" }, "<leader>f", conform.format, "conform: format file or range")
	end,
}
