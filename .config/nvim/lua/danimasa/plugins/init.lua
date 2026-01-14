return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"dart-lang/dart-vim-plugin",
	"github/copilot.vim",
	{
		"crispgm/cmp-beancount",
		dependencies = { "hrsh7th/nvim-cmp" },
		ft = { "beancount", "bean" },
	},
}
