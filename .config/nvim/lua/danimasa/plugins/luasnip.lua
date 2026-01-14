return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	event = "InsertEnter",
	config = function()
		require("luasnip.loaders.from_lua").lazy_load({ paths = "./lua/danimasa/luasnip" })
		local ls = require("luasnip")
		ls.setup({
			update_events = { "TextChanged", "TextChangedI" },
			enable_autosnippets = true,
		})

		vim.keymap.set({ "i" }, "<C-k>", function()
			ls.expand()
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-Right>", function()
			ls.jump(1)
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-Left>", function()
			ls.jump(-1)
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })
	end,
}
