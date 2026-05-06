-- https://github.com/smoka7/hop.nvim

local function setup()
	require("hop").setup({
		keys = "qwertyuiopasdfghjklzxcvbnm",
	})
end

return {
	"smoka7/hop.nvim",
	version = "*",
	config = setup,
}

