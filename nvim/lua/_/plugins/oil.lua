return {
	"stevearc/oil.nvim",
	opts = {
		delete_to_trash = true,
		prompt_save_on_select_new_entry = false,
		restore_win_options = false,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name, _)
				local always_hidden = {
					"..",
					".git",
					"node_modules",
				}
				for _, a in ipairs(always_hidden) do
					if a == name then
						return true
					end
				end
			end,
		},
		keymaps = {
			["gd"] = {
				desc = "toggle detail view",
				callback = function()
					local oil = require("oil")
					local config = require("oil.config")
					if #config.columns == 1 then
						oil.set_columns({ "icon", "permissions", "size", "mtime" })
					else
						oil.set_columns({ "icon" })
					end
				end,
			},
		},
	},
	config = function(_, opts)
		local oil = require("oil")
		oil.setup(opts)
		local open_cwd = function()
			oil.open(vim.fn.getcwd())
		end
		local k = require("_.lib.k")
		k("n", "-", oil.open, "oil: open parent directory")
		k("n", "_", open_cwd, "oil: open cwd")
	end,
}
