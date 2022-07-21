return {
	"bluz71/vim-nightfly-guicolors",
	-- priority = 1000,
	config = function()
		vim.g.nightflyUndercurls = false
		vim.cmd([[colorscheme nightfly]])
	end,
}
