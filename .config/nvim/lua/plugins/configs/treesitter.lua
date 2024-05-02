local function build()
 require("nvim-treesitter.install").update({ with_sync = true })()
end

return { 
  "nvim-treesitter/nvim-treesitter",
  name = "treesitter",
  build = build, 
}

