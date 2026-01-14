return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "pesquisa",
				path = "~/OneDrive/8 Notas/Pesquisa",
			},
		},
		daily_notes = {
			folder = "06 - Diário",
			date_format = "%Y%m%d",
			template = "99 - Meta/Templates/Daily.md",
		},
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
		templates = {
			folder = "99 - Meta/Templates",
		},
		picker = {
			name = "telescope.nvim",
		},
		attachments = {
			img_folder = "99 - Meta/Anexos",
		},
		notes_subdir = "05 - Fugazes",
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,
	},
}
