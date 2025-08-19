return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	event = "InsertEnter",
	config = function()
		require("luasnip.loaders.from_lua").lazy_load({ paths = "./lua/danimasa/luasnip/" })
		local ls = require("luasnip")
		ls.setup({
			update_events = { "TextChanged", "TextChangedI" },
			enable_autosnippets = true,
		})
	end,
}
