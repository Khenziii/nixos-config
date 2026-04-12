-- https://github.com/williamboman/mason-lspconfig.nvim

-- Use this to install LSPs by name if multiple ones have the same key.
-- For example in cases like this:
-- stylelint-language-server *stylelint_lsp* (keywords: stylelint)
-- stylelint-lsp *stylelint_lsp* (keywords: stylelint) deprecated
local function ensure_lsp_installed_by_name(name, version)
	local registry = require("mason-registry")
	local pkg = registry.get_package(name)

	if not pkg:is_installed() then
		pkg:install({ version = version })
	end
end

local function setup()
	ensure_lsp_installed_by_name("stylelint-language-server", "1.1.1");

	require("mason-lspconfig").setup({
		ensure_installed = {
			"lua_ls@3.10.6",
			"ts_ls@4.3.3",
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
			-- "stylelint_lsp@2.0.0", | This has been deprecated, and now `stylelint-language-server` is installed by name, as it had the same key.
			-- "clangd@20.1.0", | This is installed via home manager's config, as we need the wrapped version of `clangd` to find certain headers.
			"rust_analyzer@2025-08-25",
			"gopls@v0.21.1",
		},
	})
end

return {
	"williamboman/mason-lspconfig.nvim",
	config = setup,
}
