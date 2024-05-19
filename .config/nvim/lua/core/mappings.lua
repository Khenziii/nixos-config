local tree_focus = {
	mode = "n",
	key = "<LEADER>f",
	command = ":NvimTreeFocus<CR>",
	options = {
		noremap = true,
		silent = true,
	},
}

local exit_insert_mode = {
	mode = "i",
	key = "<LEADER>jk",
	command = "<ESC>",
	options = {
		noremap = true,
		silent = true,
	},
}

return {
	tree_focus,
	exit_insert_mode,
}

