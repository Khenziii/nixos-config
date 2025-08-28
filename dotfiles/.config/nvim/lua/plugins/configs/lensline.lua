-- https://github.com/oribarilan/lensline.nvim

local function setup()
    require("lensline").setup()
end

return {
    'oribarilan/lensline.nvim',
    tag = '1.0.0', -- or: branch = 'release/1.x' for latest non-breaking updates
    event = 'LspAttach',
    config = setup,
}

