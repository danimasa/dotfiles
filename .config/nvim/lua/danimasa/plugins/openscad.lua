return {
	"salkin-mada/openscad.nvim",
	config = function()
		vim.g.openscad_load_snippets = true
		vim.g.openscad_cheatsheet_toggle_key = "<leader>oc"
		vim.g.openscad_help_trig_key = "<A-h>"
		vim.g.openscad_help_manual_trig_key = "<A-m>"
		vim.g.openscad_exec_openscad_trig_key = "<A-o>"
		vim.g.openscad_top_toggle = "<A-c>"
		require("openscad")
	end,
	dependencies = { "L3MON4D3/LuaSnip", "junegunn/fzf.vim" },
}
