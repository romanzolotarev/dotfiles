return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-git",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"l3mon4d3/luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			completion = { completeopt = "menu,menuone,preview,noselect" },
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<c-p>"] = cmp.mapping.select_prev_item(),
				["<c-n>"] = cmp.mapping.select_next_item(),
				["<c-j>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
				["<c-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
				["<c-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
				["<tab>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" },
				{ name = "buffer" },
			}),
		})
	end,
}
