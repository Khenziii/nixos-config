return {
	"kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
		lang = "python",
		image_support = true,
    },
}

