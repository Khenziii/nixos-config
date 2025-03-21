local tree_focus = {
	mode = "n",
	key = "<LEADER>f",
	command = ":NvimTreeFocus<CR>",
	options = {
		noremap = true,
		silent = true,
	},
}

local tree_toggle = {
	mode = "n",
	key = "<LEADER>q",
	command = ":NvimTreeToggle<CR>",
	options = {
		noremap = true,
		silent = true,
	},
}

local exit_insert_mode = {
	mode = "i",
	key = "<LEADER>j",
	command = "<ESC>",
	options = {
		noremap = true,
		silent = true,
	},
}

local clear_highlights = {
	mode = "n",
	key = "<LEADER>c",
	command = ":noh<CR>",
	options = {
		noremap = true,
		silent = true,
	},
}

local telescope_live_grep = {
	mode = "n",
	key = "<LEADER>s",
	command = ":Telescope live_grep<CR>",
	options = {
		noremap = true,
		silent = true,
	},
}

local telescope_find_files = {
	mode = "n",
	key = "<LEADER>d",
	command = ":Telescope find_files hidden=true<CR>",
	options = {
		noremap = true,
		silent = true,
	},
}

local open_tab = {
    mode = "n",
    key = "<LEADER>n",
    command = ":$tabnew<CR>",
	options = {
		noremap = true,
		silent = true,
	},
}

local close_tab = {
    mode = "n",
    key = "<LEADER>x",
    command = ":tabclose<CR>",
	options = {
		noremap = true,
		silent = true,
	},
}

local show_full_error = {
    mode = "n",
    key = "<LEADER>z",
    command = ":lua vim.diagnostic.open_float()<CR>",
	options = {
		noremap = true,
		silent = true,
	},
}

local open_in_browser = {
    mode = "n",
    key = "<LEADER>v",
    command = ":lua Snacks.gitbrowse()<CR>",
    options = {
        noremap = true,
        silent = true,
    },
}

local format_file = {
    mode = "n",
    key = "<LEADER>g",
    command = ":lua vim.lsp.buf.format()<CR>",
    options = {
        noremap = true,
        silent = true,
    },
}

return {
	tree_focus,
	exit_insert_mode,
	clear_highlights,
	telescope_live_grep,
	telescope_find_files,
	tree_toggle,
	open_tab,
	close_tab,
    show_full_error,
    open_in_browser,
    format_file
}

