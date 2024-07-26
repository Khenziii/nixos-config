-- https://github.com/startup-nvim/startup.nvim

local settings = {
	logo = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "",
		margin = 5,
		content = {
			"███  █ ",
			"  █ ███",
			"███ █ █",
			"  █ ███",
			"███ █ █",
			"       ",
			"██  ███",
			"  █ █ █",
			" █  ███",
			"█     █",
			"███ ███",
		},
		highlight = "Normal",
		default_color = "",
		oldfiles_amount = 0,
	},
	quote_first_paragraph = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "",
		margin = 5,
		content = {
			'"I use NixOS, btw"',
		},
		highlight = "String",
		default_color = "",
		oldfiles_amount = 0,
	},
	quote_second_paragraph = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "",
		margin = 5,
		content = {
			"~ Sun Tzu, The Art of War",
		},
		highlight = "String",
		default_color = "",
		oldfiles_amount = 0,
	},
	commands = {
		type = "mapping",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "",
		margin = 5,
		content = {
			{
				"Focus On NvimTree",
				"NvimTreeFocus",
				"f",
			},
		},
		highlight = "Statement",
		default_color = "",
		oldfiles_amount = 0,
	},
	old_files = {
		type = "oldfiles",
		oldfiles_directory = true,
		align = "center",
		fold_section = false,
		title = "",
		margin = 5,
		content = "",
		highlight = "Number",
		default_color = "",
		oldfiles_amount = 10,
	},
	clock = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "",
		margin = 5,
		content = function()
			local time = os.date("%H:%M")
			local date = os.date("%d/%m/%Y")
			return {
				time,
				date,
			}
		end,
		highlight = "Normal",
		default_color = "",
		oldfiles_amount = 0,
	},
	options = {
		mapping_keys = true,
		cursor_column = 0.5,
		empty_lines_between_mappings = true,
		disable_statuslines = false,
		-- WARNING !!!
		-- bellow array needs to have greater
		-- (or equal) length, than the `parts` one
		paddings = {
			1,
			1,
			0,
			2,
			1,
			1,
		},
	},
	mappings = {
		execute_command = "<CR>",
		open_file = "<ENTER>",
		open_file_split = "<c-o>",
		open_section = "<TAB>",
		open_help = "?",
	},
	colors = {
		background = "#262626",
		folded_section = "#1C1C1C",
	},
	parts = {
		"logo",
		"quote_first_paragraph",
		"quote_second_paragraph",
		"commands",
		"old_files",
		"clock",
	},
}

local function setup()
	require("startup").setup(settings)
end

return {
	"startup-nvim/startup.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = setup,
}

