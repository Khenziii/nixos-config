-- https://github.com/nvim-telescope/telescope.nvim

local function setup()
	require("telescope").setup({
		defaults = {
			vimgrep_arguments = {
      			'rg',
      			'--color=never',
      			'--no-heading',
      			'--with-filename',
      			'--line-number',
      			'--column',
      			'--smart-case',
      			'--hidden', -- include dotfiles
      			'--no-ignore', -- include VCS ignored files 
    		},
		},
	})
end

return {
    "nvim-telescope/telescope.nvim",
	config = setup,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

