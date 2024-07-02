-- https://github.com/williamboman/mason.nvim

local function setup()
	require("mason").setup({
		max_concurrent_insallers = 3,
	})
end

return {
    "williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = setup,
    priority = 1, -- this needs to load before mason-lspconfig
}

