-- https://github.com/nvim-treesitter/nvim-treesitter

local function setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"yuck",
			"javascript",
			"typescript",
			"python",
			"markdown",
			"html",
			"css",
            "nix",
            "c_sharp",
		},
		with_sync = true,
		auto_install = true,
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	config = setup,
	priority = 1,
}

