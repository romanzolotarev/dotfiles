return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"whoissethdaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"cssls",
				"html",
				"lua_ls",
				"tsserver",
			},
			automatic_installation = true,
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"bash-language-server",
				"eslint_d",
				"luacheck",
				"markdownlint",
				"prettier",
				"shellcheck",
				"shfmt",
				"stylua",
			},
		})
	end,
}
