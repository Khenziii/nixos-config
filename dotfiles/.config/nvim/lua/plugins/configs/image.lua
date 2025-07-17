-- https://github.com/3rd/image.nvim

local function setup()
	require("image").setup({
        integrations = {
            markdown = {
                enabled = false,
            },
        },
    })
end

return {
	"3rd/image.nvim",
	config = setup,
}

