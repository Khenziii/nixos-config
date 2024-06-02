-- https://github.com/nvim-tree/nvim-tree.lua

local function setup()
	require("nvim-tree").setup({
		git = {
			enable = true,
			ignore = false,
			timeout = 500,
		},
	})
end

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = setup,
}

