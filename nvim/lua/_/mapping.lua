local k = vim.keymap.set
local opts = { noremap = true, silent = true }

k("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

k("i", "<C-s>", "<Esc>mm[s1z=`mi", opts)
k("n", "<C-s>", "[s1z=<C-o>", opts)
k("n", "<Leader>/", ":Telescope live_grep<CR>", opts)
k("n", "<Leader>a", ":Telescope find_files<CR>", opts)
k("n", "<Leader>b", ":Telescope buffers<CR>", opts)
k("n", "<Leader>q", ":quit<CR>", opts)
k("n", "<Leader>w", ":W<CR>", opts)
k("n", "<Leader>gr", ":Gr<CR>", opts)
k("n", "<Leader>gw", ":Gw<CR>", opts)
k("n", "j", "gj", opts)
k("n", "k", "gk", opts)
k("v", "<", "<gv", opts)
k("v", "<C-v>", "<Plug>(expand_region_expand)", opts)
k("v", ">", ">gv", opts)
k("v", "Y", "myY`y", opts)
k("v", "v", "<Plug>(expand_region_expand)", opts)
k("v", "y", "myy`y", opts)
k("x", "p", "pgvy", opts)
k("n", "<Leader>f", ":lua vim.lsp.buf.format({async = true})<CR>", opts)
