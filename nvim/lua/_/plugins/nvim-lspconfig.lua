return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local k = require("_.lib.k")
		k("n", "<leader>e", vim.diagnostic.open_float, "lsp: open diagnostic")
		k("n", "<leader>l", vim.diagnostic.setloclist, "lsp: loclist diagnostic")
		k("n", "[d", vim.diagnostic.goto_prev, "lsp: diagnostic prev")
		k("n", "]d", vim.diagnostic.goto_next, "lsp: diagnostic next")

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local on_attach = function(_, b)
			k("n", "<c-k>", vim.lsp.buf.signature_help, "lsp: signature help", b)
			k("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "lsp: telescope diagnostic", b)
			k("n", "<leader>c", vim.lsp.buf.code_action, "lsp: code action", b)
			k("n", "<leader>r", vim.lsp.buf.rename, "lsp: rename", b)
			k("n", "<leader>rs", ":LspRestart<CR>", "lsp: restart", b)
			k("n", "K", vim.lsp.buf.hover, "lsp: hover", b)
			k("n", "gD", vim.lsp.buf.declaration, b)
			k("n", "gd", "<cmd>Telescope lsp_definitions<cr>", "lsp: telescope definitions", b)
			k("n", "gi", "<cmd>Telescope lsp_implementations<cr>", "lsp: telescope implementations", b)
			k("n", "gr", "<cmd>Telescope lsp_references<cr>", "lsp: telescpe references", b)
			k("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", "lsp: telescope type definitions", b)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local opts = { capabilities = capabilities, on_attach = on_attach }
		lspconfig["bashls"].setup(opts)
		lspconfig["cssls"].setup(opts)
		lspconfig["html"].setup(opts)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					telemetry = { enable = false },
					workspace = { library = vim.api.nvim_get_runtime_file("", true) },
				},
			},
		})
		lspconfig["tsserver"].setup(opts)
	end,
}
