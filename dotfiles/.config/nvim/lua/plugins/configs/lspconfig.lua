-- https://github.com/neovim/nvim-lspconfig

local function setup()
	local lspconfig = require("lspconfig")
	local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
        "lua_ls",
        "tsserver",
        "nil_ls",
        "pylsp",
        "csharp_ls",
        "html",
        "cssls",
        "asm_lsp",
    }

    for _, server in ipairs(servers) do
        lspconfig[server].setup({
            capabilities = lsp_capabilities,
        })
    end
end

return {
	"neovim/nvim-lspconfig",
	config = setup,
}

