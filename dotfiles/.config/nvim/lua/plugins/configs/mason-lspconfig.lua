-- https://github.com/williamboman/mason-lspconfig.nvim

local function setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "tsserver",
            "nil_ls",
            "pylsp",
            "csharp_ls",
            "html",
            "cssls",
            "asm_lsp",
            "jdtls",
            "kotlin_language_server",
            "eslint",
            "stylelint_lsp",
        },
    })
end

return {
    "williamboman/mason-lspconfig.nvim",
	config = setup,
}

