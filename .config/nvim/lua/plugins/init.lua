local configs = require("plugins.configs")

local catppuccin = configs.catppuccin
local treesitter = configs.treesitter

-- For a explicit type definition of this variable, checkout:
-- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-plugin-spec
local plugins = {
 { 
  "catppuccin/nvim",
  name = "catppuccin",
  config = catppuccin.setup, 
 },
 { 
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter",
  build = treesitter.build, 
 },
}

return {
 plugins = plugins,
}

