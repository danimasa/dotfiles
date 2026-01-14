local prompts = {
	-- Code related prompts
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	FixError = "Please explain the error in the following text and provide a solution.",
	BetterNamings = "Please provide better names for the following variables and functions.",
	Documentation = "Please provide documentation for the following code.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
	-- Text related prompts
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}

return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "github/copilot.vim" },
		{ "nvim-lua/plenary.nvim" },
	},
	build = "make tiktoken",
	config = function(_, opts)
		local chat = require("CopilotChat")
		local select = require("CopilotChat.select")

		opts.selections = select.unnamed

		chat.setup(opts)

		vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
			chat.ask(args.args, { selection = select.visual })
		end, { nargs = "*", range = true })

		vim.api.nvim_create_user_command("CopilotChatInline", function(args)
			chat.ask(args.args, {
				selection = select.visual,
				window = {
					layout = "float",
					relative = "cursor",
					width = 1,
					height = 0.4,
					row = 1,
				},
			})
		end, { nargs = "*", range = true })

		-- Restore CopilotChatBuffer
		vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
			chat.ask(args.args, { selection = select.buffer })
		end, { nargs = "*", range = true })

		-- Custom buffer for CopilotChat
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "copilot-*",
			callback = function()
				vim.opt_local.relativenumber = true
				vim.opt_local.number = true

				-- Get current filetype and set it to markdown if the current filetype is copilot-chat
				local ft = vim.bo.filetype
				if ft == "copilot-chat" then
					vim.bo.filetype = "markdown"
				end
			end,
		})
	end,
	event = "VeryLazy",
	opts = {
		prompts = prompts,
	},
	keys = {
		{ "<leader>cpi", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
		{
			"<leader>cpq",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
				end
			end,
			desc = "CopilotChat - Quick Chat",
		},
		{
			"<leader>cpa",
			function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
			end,
			desc = "CopilotChat - Prompt actions",
		},
		-- Code related commands
		{ "<leader>cpe", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
		{ "<leader>cpt", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
		{ "<leader>cpr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
		{ "<leader>cpR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
		{ "<leader>cpn", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
		-- Chat with Copilot in visual mode
		{
			"<leader>cpv",
			":CopilotChatVisual",
			mode = "x",
			desc = "CopilotChat - Open in vertical split",
		},
		{
			"<leader>cpx",
			":CopilotChatInline<cr>",
			mode = "x",
			desc = "CopilotChat - Inline chat",
		},
		-- Generate commit message based on the git diff
		{
			"<leader>cpm",
			"<cmd>CopilotChatCommit<cr>",
			desc = "CopilotChat - Generate commit message",
		},
		-- Debug
		{ "<leader>cpd", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
		-- Fix the issue with diagnostic
		{ "<leader>cpf", "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix Diagnostic" },
		-- Clear buffer and chat history
		{ "<leader>cpl", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
		-- Copilot Chat Models
		{ "<leader>cp?", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat - Select Models" },
	},
}
