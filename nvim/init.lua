local o = vim.o
local k = require("_.lib.k")

k("n", "<space>", "<nop>", "nop")
vim.g.mapleader = " "

k("i", "<c-s>", "<esc>mm[s1z=`mi", "core: correct previous misspell")
k("n", "<c-s>", "[s1z=<c-o>", "core: correct previous misspell")
k("n", "<leader>q", "<cmd>quit<cr>", "core: quit buffer")
k("n", "<leader>w", "<cmd>write<cr>", "core: write buffer")
k("n", "j", "gj", "core: gj")
k("n", "k", "gk", "core: gk")
k("v", "<", "<gv", "core: <gv")
k("v", ">", ">gv", "core: >gv")
k("v", "Y", "myY`y", "core: yank line to `y")
k("v", "y", "myy`y", "core: yank to `y")
k("x", "p", "pgvy", "core: paste from `y")

o.clipboard = "unnamedplus"
o.comments = "b:*,b:-,b:+,n:>:"
o.cursorline = true
o.formatoptions = "1abBcjlnopqrw"
o.ignorecase = true
o.laststatus = 1
o.list = true
o.shadafile = vim.fn.stdpath("cache") .. "/shada"
o.shiftwidth = 2
o.smartcase = true
o.tabstop = 2
o.undofile = true
o.wildignorecase = true
o.wrap = false

require("_.lazy")
