-- https://github.com/airblade/vim-gitgutter 

local function setup()
	vim.g.gitgutter_sign_added = "+"
	vim.g.gitgutter_sign_removed = "-"
	vim.g.gitgutter_sign_modified = "~"
	vim.g.gitgutter_removed_first_line = "-^"
	vim.g.gitgutter_sign_modified_removed = "~-"
end

return {
	"airblade/vim-gitgutter",
	config = setup,
}

