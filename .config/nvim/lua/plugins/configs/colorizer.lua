-- https://github.com/norcalli/nvim-colorizer.lua

local function setup()
	require("colorizer").setup({
		mode = "background",
	})
end

return {
	"norcalli/nvim-colorizer.lua",
	config = setup,
}

