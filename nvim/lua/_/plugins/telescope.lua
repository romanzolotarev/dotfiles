return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = require("telescope.themes").get_dropdown({
				border = false,
				layout_strategy = "bottom_pane",
				layout_config = { height = 100 },
			}),
		})

		telescope.load_extension("fzf")
    local t =  require("telescope.builtin")
		local k = require("_.lib.k")
		k("n", "<leader>/", t.live_grep, "telescope: live grep")
		k("n", "<leader>s", t.grep_string, "telescope: live grep")
		k("n", "<leader>a", t.find_files, "telescope: find files")
		k("n", "<leader>b", t.buffers, "telescope: buffers")
	end,
}
