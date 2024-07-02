local plugins = {
	"catppuccin",
	"treesitter",
	"tree",
	"presence",
	"wakatime",
	"fugitive",
	"startup",
	"autopairs",
	"lspconfig",
	"cmp",
	"luasnip",
	"mason",
	"gitgutter",
	"leetcode",
	"image",
	"toggleterm",
	"vim-prisma",
	"colorizer",
	"yuck",
	"telescope",
	"mason-lspconfig",
}

local function get_plugins(plugin_names)
	local plugins_array = {}
	for _, plugin_name in ipairs(plugin_names) do
		local plugin = require(string.format("plugins.configs.%s", plugin_name))
		table.insert(plugins_array, plugin)
	end
	return plugins_array
end

return get_plugins(plugins)

