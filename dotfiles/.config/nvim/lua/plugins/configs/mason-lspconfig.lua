-- https://github.com/williamboman/mason-lspconfig.nvim

local function setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "tsserver",
            "nil_ls",
            "pylsp",
        },
    })
end

return {
    "williamboman/mason-lspconfig.nvim",
	config = setup,
}

