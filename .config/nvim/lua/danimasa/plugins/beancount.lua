return {
	"hxueh/beancount.nvim",
	ft = { "beancount", "bean" },
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
	},
	config = function()
		require("beancount").setup({
			instant_alignment = true,
			inlay_hints = true,
			snippets = {
				enabled = true,
			},
		})
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "beancount" },
			highlight = { enable = true },
			incremental_selection = { enable = true },
			indent = { enable = true },
		})
	end,
}
