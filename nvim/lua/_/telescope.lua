local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

local themes = require("telescope.themes")

telescope.setup({
	defaults = themes.get_dropdown({
		border = false,
		layout_strategy = "bottom_pane",
		layout_config = { height = 100 },
	}),
})
