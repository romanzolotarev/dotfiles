local pkgs = {
	"savq/paq-nvim",
	--
	"farmergreg/vim-lastplace",
	"github/copilot.vim",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-git",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-path",
	"hrsh7th/nvim-cmp",
	"joosepalviste/nvim-ts-context-commentstring",
	"jose-elias-alvarez/null-ls.nvim",
	"junegunn/vim-easy-align",
	"lewis6991/gitsigns.nvim",
	"neovim/nvim-lspconfig",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-treesitter/nvim-treesitter",
	"rgzee/dark.nvim",
	"terryma/vim-expand-region",
	"tpope/vim-commentary",
	"tpope/vim-eunuch",
	"tpope/vim-fugitive",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-unimpaired",
	"tpope/vim-vinegar",
	"williamboman/nvim-lsp-installer",
}

local ok, paq = pcall(require, "paq")
if ok and paq then
	paq(pkgs)
end

return { pkgs = pkgs }
