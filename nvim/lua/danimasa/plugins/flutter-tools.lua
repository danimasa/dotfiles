return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			decorations = {
				statusline = {
					app_version = true,
					device = true,
				},
			},
			widget_guides = {
				enabled = true,
			},
			lsp = {
				color = {
					enabled = true,
					background = true,
					virtual_text = true,
					virtual_text_str = "■",
				},
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					enableSnippets = true,
					updateImportsOnRename = true,
				},
			},
		})
	end,
	keys = {
		{ "<leader>flr", "<cmd>FlutterRun<cr>", desc = "Run Flutter App" },
		{ "<leader>flx", "<cmd>FlutterQuit<cr>", desc = "Quit Flutter App" },
		{ "<leader>flh", "<cmd>FlutterReload<cr>", desc = "Hot Reload Flutter App" },
		{ "<leader>flH", "<cmd>FlutterRestart<cr>", desc = "Hot Restart Flutter App" },
		{ "<leader>fld", "<cmd>FlutterDevices<cr>", desc = "List Available Flutter Devices" },
		{ "<leader>flo", "<cmd>FlutterOutlineToggle<cr>", desc = "Toggle Flutter Outline" },
		{ "<leader>fll", "<cmd>FlutterLogToggle<cr>", desc = "Toggle Flutter Logs" },
	},
}
