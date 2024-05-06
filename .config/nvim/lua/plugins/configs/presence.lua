-- https://github.com/andweeb/presence.nvim

local function setup()
	require("presence").setup(
		{
			auto_update = true,
			neovim_image_text = "what a chad editor!", -- This displays, when someone hovers over the main image.
			main_image = "neovim", -- Can be either "neovim" or "file".
			debounce_timeout = 10, -- How often the presence should be updated (seconds).
			buttons = true,
			show_time = true,
			enable_line_number = true,
			log_level = nil,
			editing_text = "Working on %s",
			file_explorer_text = "Browsing using %s",
			git_commit_text = "Writing a git commit",
			plugin_manager_text = "Managing plugins",
			reading_text = "Reading %s",
			workspace_text = "Playing around with %s",
			line_number_text = "Line: %s/%s",
		}
	)
end

return {
	"andweeb/presence.nvim",
	config = setup,
}

