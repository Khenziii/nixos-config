## nvim Configuration

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

## Adding Support For New Language

**TO DO: write this section**

## Formatting The Code  

If you want to do so, you can format the entire codebase using [LuaFormatter](https://github.com/Koihik/LuaFormatter). I have created `.lua-format`, so it's a matter of running this command:

```shell
$ find . -name "*.lua" -exec lua-format {} -i -c ~/dotfiles/.config/nvim/.lua-format
```

