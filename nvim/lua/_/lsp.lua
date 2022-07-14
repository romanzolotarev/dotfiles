local lspconfig = require("lspconfig")

require("nvim-lsp-installer").setup({ automatic_installation = true })

local opts = { noremap = true, silent = true }
local k = vim.keymap.set

k("n", "<Leader>e", vim.diagnostic.open_float, opts)
k("n", "<Leader>l", vim.diagnostic.setloclist, opts)
k("n", "[d", vim.diagnostic.goto_prev, opts)
k("n", "]d", vim.diagnostic.goto_next, opts)

local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local bopts = { noremap = true, silent = true, buffer = bufnr }
	k("n", "gr", vim.lsp.buf.references, bopts)
	k("n", "gi", vim.lsp.buf.implementation, bopts)
	k("n", "gd", vim.lsp.buf.definition, bopts)
	k("n", "gD", vim.lsp.buf.declaration, bopts)
	k("n", "K", vim.lsp.buf.hover, bopts)
	k("n", "<Leader>r", vim.lsp.buf.rename, bopts)
	k("n", "<Leader>d", vim.lsp.buf.type_definition, bopts)
	k("n", "<Leader>c", vim.lsp.buf.code_action, bopts)
	k("n", "<C-k>", vim.lsp.buf.signature_help, bopts)
end

lspconfig["bashls"].setup({ on_attach = on_attach })
lspconfig["tsserver"].setup({ on_attach = on_attach })
lspconfig["sumneko_lua"].setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "require" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})
