-- https://github.com/nvim-telescope/telescope.nvim

-- telescope won't show any results from these files / directories.
local ignored_files_and_dirs = {
    "node_modules",
    "dist",
    ".git",
    ".next",
    "yarn.lock",
};

-- telescope expects ignored files in this format:
-- "!{first_ignored_file,second_ignored_file}"
-- this functions handles the conversion of a string table
-- to a single string in the mentioned format.
local function string_table_to_glob_string(string_table)
    local result = "!{";

    for index, str in ipairs(string_table) do
        -- concat our string to the result
        result = result .. str;

        -- if not the last item, concat a comma
        if index < #string_table then
            result = result .. ",";
        end
    end

    -- close the string
    result = result .. "}";
    return result;
end

local function setup()
	require("telescope").setup({
		defaults = {
			vimgrep_arguments = {
      			'rg',
      			'--color=never',
      			'--no-heading',
      			'--with-filename',
      			'--line-number',
      			'--column',
      			'--smart-case',
      			'--hidden', -- include dotfiles
      			'--no-ignore', -- include VCS ignored files 
                '--glob', -- ignore files listed in `ignored_files_and_dirs`
                string_table_to_glob_string(ignored_files_and_dirs),
    		},
		},
	})
end

return {
    "nvim-telescope/telescope.nvim",
	config = setup,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

