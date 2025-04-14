local isMac = vim.fn.has("macunix")

local function getKey(key)
	if isMac == 1 then
		return "<S-" .. key .. ">"
	else
		return "<C-" .. key .. ">"
	end
end

return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateRight",
		"TmuxNavigateUp",
		"TmuxNavigateDown",
		"TmuxNavigatePrevious",
		"TmuxNavigatorProcessList",
	},
	keys = {
		{ getKey("Left"), "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate to left tmux pane" },
		{ getKey("Down"), "<cmd>TmuxNavigateDown<CR>", desc = "Navigate to down tmux pane" },
		{ getKey("Up"), "<cmd>TmuxNavigateUp<CR>", desc = "Navigate to up tmux pane" },
		{ getKey("Right"), "<cmd>TmuxNavigateRight<CR>", desc = "Navigate to right tmux pane" },
		{ "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", desc = "Navigate to previous tmux pane" },
		{ "<leader>tm", "<cmd>TmuxNavigatorProcessList<CR>", desc = "Tmux Navigator Process List" },
	},
}
