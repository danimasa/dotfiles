return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<leader>aa",
			"<cmd>CodeCompanionActions<cr>",
			mode = { "n", "v" },
			desc = "Code Companion Actions",
		},
		{
			"<leader>am",
			"<cmd>CodeCompanion /commit<cr>",
			mode = { "n", "v" },
			desc = "Generate Commit Message",
		},
		{
			"<leader>ae",
			"<cmd>CodeCompanion /explain<cr>",
			mode = { "n", "v" },
			desc = "Explain how the code works",
		},
		{
			"<leader>af",
			"<cmd>CodeCompanion /fix<cr>",
			mode = { "n", "v" },
			desc = "Fix the code",
		},
		{
			"<leader>al",
			"<cmd>CodeCompanion /lsp<cr>",
			mode = { "n", "v" },
			desc = "Explain the LSP diagnostic",
		},
		{
			"<leader>at",
			"<cmd>CodeCompanion /tests<cr>",
			mode = { "n", "v" },
			desc = "Generate Unit Tests",
		},
		{
			"<leader>ao",
			"<cmd>CodeCompanionChat Toggle<cr>",
			mode = { "n", "v" },
			desc = "Code Companion Panel Toggle",
		},
		{
			"ga",
			"<cmd>CodeCompanionChat Add<cr>",
			mode = { "v" },
			desc = "Code Companion Add",
		},
	},
}
