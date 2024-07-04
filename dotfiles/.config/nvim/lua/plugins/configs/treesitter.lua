-- https://github.com/nvim-treesitter/nvim-treesitter

local function build()
	require("nvim-treesitter.install").update({
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
		},
		with_sync = true,
		auto_install = true,
	})()
end

return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	build = build,
	priority = 1,
}

