return {
	setup = function()
		local path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
		if vim.fn.empty(vim.fn.glob(path)) > 0 then
			vim.fn.system({
				"git",
				"clone",
				"--depth=1",
				"https://github.com/savq/paq-nvim",
				path,
			})
		end
		vim.cmd([[packadd paq-nvim"]])
		vim.cmd([[autocmd User PaqDoneInstall quit]])
		local paq = require("paq")
		paq(require("_.plugins").pkgs)
		paq.install()
	end,
}
