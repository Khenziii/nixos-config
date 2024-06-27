-- https://github.com/akinsho/toggleterm.nvim

local function setup()
	require("toggleterm").setup({
		-- open_mapping = [[<LEADER>t]],
		direction = "float",
	})
end

return {
	"akinsho/toggleterm.nvim",
	config = setup,
}

