local function build()
 require("nvim-treesitter.install").update({ with_sync = true })()
end

return {
 build = build,
}


