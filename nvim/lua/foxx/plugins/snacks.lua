return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		local snacks = require("snacks")
		snacks.setup({
			dashboard = {
				enabled = true,
				width = 60,
				row = nil, -- dashboard position. nil for center
				col = nil, -- dashboard position. nil for center
				pane_gap = 4, -- empty columns between vertical panes
				autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
				preset = {
					pick = nil,
					keys = {
						{
							icon = "🐱  ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = "🦦 ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = "🌈 ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = "🦊 ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = "🦝",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						},
						{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
						{
							icon = "👻 ",
							key = "L",
							desc = "Lazy",
							action = ":Lazy",
							enabled = package.loaded.lazy ~= nil,
						},
						{ icon = "💀 ", key = "q", desc = "Quit", action = ":qa" },
					},
					header = [[ 
 ⡛⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
 ⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⡆⠘⡇⣿⣿⣿⣇⢹⣶⣊⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠁⢻⣇⣿⣿⣿⣿⣷⣝⠿⠃⠡⠋⠏⢩⠭⢭⣙⣿⠿⠿⠿⢛⣵⣸⣿⣿⣿
⡀⢘⣿⣿⣿⣿⣿⣿⣏⡈⠀⠃⠀⠀⠀⠀⡍⠐⠀⠀⢑⣴⣿⣿⠅⣿⣿⣿
⠁⢸⣾⣿⣿⣿⣿⣿⣯⡊⠀⠀⣀⣄⣷⡀⠀⠄⠀⢠⣟⠿⣛⣷⢦⣿⣿⣿
 ⠀⢺⣿⣿⡿⠟⠉⣿⣿⣡⣴⣾⣿⣿⣯⢀⢸⣮⣾⣿⣷⣾⣿⡏⣼⣿⣿⣿
⡀⢸⣿⣿⡃⠀⠀⠈⠉⠉⠿⢿⠿⠿⠿⠿⠓⠚⠛⠻⠿⣛⣹⣿⣦⠹⣿⣿
⠰⢸⣿⣿⣿⣄⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠼⣿⣟⣿⣿⣧⠙⣿
⢠⣸⣿⣿⣿⣿⣷⣤⣄⣠⡸⠿⠷⣄⣀⠀⠀⢀⣀⣤⣾⣿⣙⣿⣿⣿⣧⠹
⢸ ⣿⣿⡟⣿⣿⣿⣮⣛⣿⡀⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⡆
⣘⣘⡻⠏⣼⣿⣿⣿⣿⣿⣷⣮⣭⣽⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷
⣿⣿⠏⣼⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣯⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
💖 You are doing the best you can! Keep going! 🚀
          ]],
				},
				sections = {
					{ section = "header" },
					{ pane = 2, section = "keys", gap = 1, padding = 1 },
					{
						pane = 2,
						icon = "👀 ",
						title = "Recent Files",
						section = "recent_files",
						indent = 2,
						padding = 1,
					},
					{ pane = 2, icon = "💅 ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{ section = "startup" },
				},
			},
			git = { enabled = true },
			lazygit = { enabled = true },
			notify = { enabled = true },
			terminal = { enabled = true },
			toggle = { enabled = true },
			win = { enabled = true },
		})

		-- Manually show dashboard on startup
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.argc() == 0 then
					snacks.dashboard.open()
				end
			end,
		})
	end,
}
