return function(mode, lhs, rhs, desc, buffer)
	return vim.keymap.set(mode, lhs, rhs, {
		noremap = true,
		silent = true,
		desc = desc,
		buffer = buffer,
	})
end
