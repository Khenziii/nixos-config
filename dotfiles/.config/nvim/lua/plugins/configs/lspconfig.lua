-- https://github.com/neovim/nvim-lspconfig

local function setup()
	local lspconfig = require("lspconfig")
	local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
        { name = "lua_ls", additional_settings = {
            settings = {
                Lua = {
                    format = {
                        enable = false
                    }
                }
            }
        } },
        { name = "ts_ls", additional_settings = {} },
        { name = "nil_ls", additional_settings = {} },
        { name = "pylsp", additional_settings = {} },
        { name = "csharp_ls", additional_settings = {} },
        { name = "html", additional_settings = {} },
        { name = "cssls", additional_settings = {} },
        { name = "asm_lsp", additional_settings = {} },
        { name = "gdscript", additional_settings = {} },
        { name = "jdtls", additional_settings = {} },
        { name = "kotlin_language_server", additional_settings = {} },
        { name = "eslint", additional_settings = {} },
        { name = "stylelint_lsp", additional_settings = {
            filetypes = { "css", "scss", "less" },
        } },
        { name = "clangd", additional_settings = {} },
        { name = "rust_analyzer", additional_settings = {} },
    }

    for _, server in ipairs(servers) do
        lspconfig[server.name].setup(vim.tbl_extend("force", {
            capabilities = lsp_capabilities,
        }, server.additional_settings))
    end
end

return {
	"neovim/nvim-lspconfig",
	config = setup,
}

