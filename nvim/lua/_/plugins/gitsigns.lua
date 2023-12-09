return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gs = require("gitsigns")
		gs.setup({
			on_attach = function()
				local k = require("_.lib.k")
				k("n", "]c", function()
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, "gitsigns: next hunk")
				k("n", "[c", function()
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, "gitsigns: prev hunk")
				k("n", "<leader>hR", gs.reset_buffer, "gitsigns: reset buffer")
				k("n", "<leader>hS", gs.stage_buffer, "gitsigns: stage buffer")
				k("n", "<leader>hd", gs.diffthis, "gitsigns: diff this")
				k("n", "<leader>hr", gs.reset_hunk, "gitsigns: reset hunk")
				k("n", "<leader>hs", gs.stage_hunk, "gitsigns: stage hunk")
				k("n", "<leader>hu", gs.undo_stage_hunk, "gitsigns: undo stage hunk")
				k("n", "<leader>td", gs.toggle_deleted, "gitsigns: toggle deleted")
				k("n", "<leader>tb", gs.toggle_current_line_blame, "gitsigns: toggle current line blame")
				k("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "gitsigns: reset hunk")
				k("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "gitsigns: stage hunk")
			end,
		})
	end,
}
