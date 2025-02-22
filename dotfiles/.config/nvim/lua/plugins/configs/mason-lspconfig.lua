-- https://github.com/williamboman/mason-lspconfig.nvim

local function setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls@3.10.6",
            "tsserver@4.3.3",
            "nil_ls@2024-08-06",
            "pylsp@1.12.0",
            "csharp_ls@0.15.0",
            "html@4.10.0",
            "cssls@4.10.0",
            "asm_lsp@0.9.0",
            -- `jdtls` doesn't support version locking..
            -- TODO: switch to a better Java LSP
            "jdtls",
            "kotlin_language_server@1.3.12",
            "eslint@4.10.0",
            "stylelint_lsp@2.0.0",
        },
    })
end

return {
    "williamboman/mason-lspconfig.nvim",
	config = setup,
}

