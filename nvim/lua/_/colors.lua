local colorscheme = "dark"

if vim.env.TERM_PROGRAM == "Apple_Terminal" then
	vim.opt.termguicolors = false
else
	vim.opt.termguicolors = true
end

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
	vim.notify(colorscheme .. " colorscheme not found")
	return
end
