## Neovim Configuration

In this directory, I keep my nvim configuration. It's modular, and pretty well organized. All of the plugins are kept in `lua/plugins` and vim's built-in settings in `lua/core`.

## Adding New Plugins

Create a file called `<plugin-name>.lua` in `lua/plugins/configs`, and add `"<plugin-name>"` to `plugins` table in `lua/plugins/configs/init.lua`. Your file should return a table that can get interpreted by [lazy.nvim](https://github.com/folke/lazy.nvim). Here's an example:

```lua
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
```

*Make sure to checkout Lazy's docs!*

## Adding Support For New Languages

Adding integration with a technology includes a couple of steps. We need to:

1. Install a Treesitter parser
2. Grab the actual LSP ([Language Server Protocol](https://en.wikipedia.org/wiki/Language_Server_Protocol)) using Mason
3. Configure [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) to use our LSP.
4. Sometimes, it's also necessary to install a tool from language's ecosystem. For example: `dotnet` is required for installing `csharp_ls` LSP. To do that, you should modify home-manager's config. Please read that module's docs.

### Installing a Treesitter parser

Navigate to `lua/plugins/configs/treesitter.lua`. Add desired lang to `ensure_installed` table that we're passing as an argument to `require("nvim-treesitter.configs").setup()`:

```lua
-- example:
ensure_installed = {
    "c_sharp", -- added `c_sharp`
},
```

### Installing an LSP using Mason

Navigate to `lua/plugins/configs/mason-lspconfig.lua`. Add desired LSP to `ensure_installed` table that we're passing as an argument to `require("mason-lspconfig").setup()`:

```lua
-- example:
ensure_installed = {
    "csharp_ls", -- added `csharp_ls`
},
```

You can browse available LSPs using `:Mason` command (searching with `/` is very useful too!).

### Configuring nvim-lspconfig to use LSPs

Navigate to `lua/plugins/configs/lspconfig.lua`. Add desired LSP to `servers` table:

```lua
-- example:
local servers = {
    "csharp_ls", -- added `csharp_ls`
}
```

As you can see, configuring nvim to support multiple languages is a breeze thanks to the awesome open-source community! With this setup, it takes 3 strings to integrate a new language.  

## Adding A New Keybind

See `lua/core/mappings.lua`, it should be pretty self explanatory xD.

## Formatting The Code

If you want to do so, you can format the entire codebase using [LuaFormatter](https://github.com/Koihik/LuaFormatter). I have created `.lua-format`, so it's a matter of running this command:

```shell
$ find . -name "*.lua" -exec lua-format {} -i -c ~/.config/nvim/.lua-format
```

