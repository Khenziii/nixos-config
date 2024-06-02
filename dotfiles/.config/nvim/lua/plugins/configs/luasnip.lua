-- https://github.com/L3MON4D3/LuaSnip

local function setup()
	require("luasnip.loaders.from_vscode").lazy_load()
end

return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets"
	},
	config = setup,
	lazy = true,
}

