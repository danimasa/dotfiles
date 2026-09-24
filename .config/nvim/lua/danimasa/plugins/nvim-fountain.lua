return {
	"0mykull/nvim-fountain",
	ft = "fountain",
	config = function()
		require("nvim-fountain").setup({
			keymaps = {
				next_scene = "]]",
				prev_scene = "[[",
				uppercase_line = "<S-CR>",
			},
			export = {
				pdf = { options = "--overwrite" },
			},
		})
	end,
}
