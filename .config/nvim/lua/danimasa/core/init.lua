require("danimasa.core.options")
require("danimasa.core.keymaps")

vim.api.nvim_create_autocmd("BufEnter", {
	command = "syntax sync fromstart",
	pattern = { "*.ly", "*.ily", "*.tex" },
})
