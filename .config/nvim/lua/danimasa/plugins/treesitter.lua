return {
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({})

			local group = vim.api.nvim_create_augroup("danimasa_treesitter", { clear = true })

			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})

			vim.keymap.set({ "n", "x" }, "<C-space>", function()
				if vim.fn.mode() ~= "v" then
					local node = vim.treesitter.get_node()
					if not node then
						return
					end
					local sr, sc, er, ec = node:range()
					vim.fn.setpos("'<", { 0, sr + 1, sc + 1, 0 })
					vim.fn.setpos("'>", { 0, er + 1, ec, 0 })
					vim.cmd("normal! gv")
				else
					vim.treesitter.select("parent")
				end
			end, { desc = "Treesitter: init/incremental selection" })

			vim.keymap.set("x", "<bs>", function()
				vim.treesitter.select("child")
			end, { desc = "Treesitter: decremental selection" })
		end,
	},
}
