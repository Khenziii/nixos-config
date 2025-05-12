-- https://github.com/nvim-treesitter/nvim-treesitter

local function setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"yuck",
			"javascript",
			"typescript",
            "tsx",
			"python",
			"markdown",
			"html",
            "scss",
			"css",
            "nix",
            "c_sharp",
            "asm",
            "gdscript",
            "java",
            "kotlin",
            "c",
		},
		auto_install = false,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	config = setup,
	priority = 1,
}

