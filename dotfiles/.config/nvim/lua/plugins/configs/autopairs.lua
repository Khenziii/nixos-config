-- https://github.com/windwp/nvim-autopairs

local function setup()
	require("nvim-autopairs").setup({
		check_ts = true,
	})
end

return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = setup,
}

