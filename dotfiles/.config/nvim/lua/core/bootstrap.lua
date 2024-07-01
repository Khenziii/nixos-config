local plugins = require("plugins")
local mappings = require("core.mappings")

local function setup_plugins()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not (vim.uv or vim.loop).fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)

	local config = {}
	require("lazy").setup(plugins, config)
end

local function setup_key_mappings()
	for _, mapping in pairs(mappings) do
		vim.api.nvim_set_keymap(mapping.mode, mapping.key, mapping.command, mapping.options)
	end
end

local function setup_vim_settings()
	vim.wo.relativenumber = true

	-- vim.opt.spell = true
	vim.opt.spelllang = {
		"en_us",
	}

	vim.opt.tabstop = 4
	vim.opt.shiftwidth = 4
	vim.opt.expandtab = true

	vim.diagnostic.config {
  		update_in_insert = true,
	}

	vim.g.mapleader = "'"

	vim.opt.updatetime = 250

	vim.o.termguicolors = true
end

return {
	setup_plugins = setup_plugins,
	setup_key_mappings = setup_key_mappings,
	setup_vim_settings = setup_vim_settings,
}

