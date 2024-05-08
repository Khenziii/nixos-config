local function setup()
	require("toggleterm").setup({
		start_in_insert = true,
	})
end

return {
	"akinsho/toggleterm.nvim",
	config = setup,
}

