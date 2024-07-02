-- https://github.com/williamboman/mason-lspconfig.nvim

local function setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "tsserver",
        },
    })
end

return {
    "williamboman/mason-lspconfig.nvim",
	config = setup,
}

