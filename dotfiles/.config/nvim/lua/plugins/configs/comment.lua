-- https://github.com/terrortylor/nvim-comment

local function setup()
    require('nvim_comment').setup({
        marker_padding = true,
        comment_empty = true,
        comment_empty_trim_whitespace = true,
        create_mappings = true,
        line_mapping = "'j",
        operator_mapping = "'a",
        comment_chunk_text_object = nil,
        hook = nil
    })
end

return {
	"terrortylor/nvim-comment",
	config = setup,
}

