local function setup()
	local lspconfig = require("lspconfig")
	local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

	lspconfig.lua_ls.setup({
		capabilities = lsp_capabilities,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = setup,
}

