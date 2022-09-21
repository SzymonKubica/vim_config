-- Version of 03.09.2022.
-- keymap.lua defines utilities to make remapping keys easier.

local M = {}

local function bind(op, outer_opts)
	outer_opts = outer_opts or {noremap = true}
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force",
			outer_opts,
			opts or {}
		)
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap_silent = bind("n",  { noremap=true, silent=true })
M.inoremap_silent = bind("i",  { noremap=true, silent=true })
M.xnoremap_silent = bind("x",  { noremap=true, silent=true })
M.nnoremap_with_buffer = function(bufnr)
	return bind("n", { noremap=true, silent=true, buffer=bufnr })
end
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")

return M
