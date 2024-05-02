local catppuccin = require("plugins.configs.catppuccin")

-- For a explicit type definition of this variable, checkout:
-- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-plugin-spec
local plugins = {
 { 
  "catppuccin/nvim",
  name = "catppuccin",
  config = catppuccin.setup, 
 },
}

return {
 plugins = plugins,
}

