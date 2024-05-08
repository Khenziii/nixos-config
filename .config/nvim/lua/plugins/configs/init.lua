local catppuccin = require("plugins.configs.catppuccin")
local treesitter = require("plugins.configs.treesitter")
local tree = require("plugins.configs.tree")
local presence = require("plugins.configs.presence")
local wakatime = require("plugins.configs.wakatime")
local fugitive = require("plugins.configs.fugitive")
local startup = require("plugins.configs.startup")
local autopairs = require("plugins.configs.autopairs")
local lspconfig = require("plugins.configs.lspconfig")
local cmp = require("plugins.configs.cmp")
local luasnip = require("plugins.configs.luasnip")
local mason = require("plugins.configs.mason")
local gitgutter = require("plugins.configs.gitgutter")
local leetcode = require("plugins.configs.leetcode")
local image = require("plugins.configs.image")
local luarocks = require("plugins.configs.luarocks")

return {
	catppuccin,
	treesitter,
	tree,
	presence,
	wakatime,
	fugitive,
	startup,
	autopairs,
	lspconfig,
	cmp,
	luasnip,
	mason,
	gitgutter,
	leetcode,
	image,
	luarocks,
}

