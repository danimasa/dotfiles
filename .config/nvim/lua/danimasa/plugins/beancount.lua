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
			main_bean_file = "/home/danimasa/Documentos/finance/personal/journal.beancount",
		})
		vim.treesitter.start(0, "beancount")
	end,
}
