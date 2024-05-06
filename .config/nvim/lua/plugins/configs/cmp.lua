-- https://github.com/hrsh7th/nvim-cmp

local function setup()
	vim.opt.completeopt = {
		"menu",
		"menuone",
		"noselect",
	}

	local cmp = require("cmp")
	local luasnip = require("luasnip")

	local select_opts = {behavior = cmp.SelectBehavior.Select}
	cmp.setup({
		snippet = {
  			expand = function(args)
    			luasnip.lsp_expand(args.body)
  			end
		},
		sources = {
			{
				name = "path",
				keyword_length = 5,
			},
  			{
				name = "nvim_lsp",
				keyword_length = 1,
			},
  			{
				name = "buffer",
				keyword_length = 3,
			},
  			{
				name = "luasnip",
				keyword_length = 2,
			},
			-- {
			--		name = "spell",
			--		keyword_length = 5,
			-- },
			{
				name = "crates",
				keyword_length = 4,
			},
			{
				name = "npm",
				keyword_length = 4,
			},
			{
				name = "html-css",
				keyword_length = 5,
			},
			{
				name = "conventionalcommits",
				keyword_length = 1,
			},
		},
		window = {
  			documentation = cmp.config.window.bordered()
		},
		formatting = {
  			fields = {
				"menu",
				"abbr",
				"kind",
			},
		},
		mapping = {
  			["<ENTER>"] = cmp.mapping.confirm({ select = true }),
			["<Up>"] = cmp.mapping.select_prev_item(select_opts),
			["<Down>"] = cmp.mapping.select_next_item(select_opts),
			["<C-k>"] = cmp.mapping.select_prev_item(select_opts),
			["<C-j>"] = cmp.mapping.select_next_item(select_opts),
		},
	})

end

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		-- "f3fora/cmp-spell",
		"saecki/crates.nvim",
		"david-kunz/cmp-npm",
		"jezda1337/nvim-html-css",
		"davidsierradz/cmp-conventionalcommits",
	},
	config = setup,
}

