return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Define the header
		local header = {
			"                 ⡛⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"                 ⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"                ⡆⠘⡇⣿⣿⣿⣇⢹⣶⣊⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"                ⠁⢻⣇⣿⣿⣿⣿⣷⣝⠿⠃⠡⠋⠏⢩⠭⢭⣙⣿⠿⠿⠿⢛⣵⣸⣿⣿⣿",
			"                ⡀⢘⣿⣿⣿⣿⣿⣿⣏⡈⠀⠃⠀⠀⠀⠀⡍⠐⠀⠀⢑⣴⣿⣿⠅⣿⣿⣿",
			"                ⠁⢸⣾⣿⣿⣿⣿⣿⣯⡊⠀⠀⣀⣄⣷⡀⠀⠄⠀⢠⣟⠿⣛⣷⢦⣿⣿⣿",
			"                ⠀⢺⣿⣿⡿⠟⠉⣿⣿⣡⣴⣾⣿⣿⣯⢀⢸⣮⣾⣿⣷⣾⣿⡏⣼⣿⣿⣿",
			"                ⡀⢸⣿⣿⡃⠀⠀⠈⠉⠉⠿⢿⠿⠿⠿⠿⠓⠚⠛⠻⠿⣛⣹⣿⣦⠹⣿⣿",
			"                ⠰⢸⣿⣿⣿⣄⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠼⣿⣟⣿⣿⣧⠙⣿",
			"                ⢠⣸⣿⣿⣿⣿⣷⣤⣄⣠⡸⠿⠷⣄⣀⠀⠀⢀⣀⣤⣾⣿⣙⣿⣿⣿⣧⠹",
			"                ⢸⢸⣿⣿⡟⣿⣿⣿⣮⣛⣿⡀⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⡆",
			"                ⣘⣘⡻⠏⣼⣿⣿⣿⣿⣿⣷⣮⣭⣽⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷",
			"                ⣿⣿⠏⣼⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"                ⣿⣯⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			"💖You are doing the best you can, take it one step at a time 🚀",
		}

		-- Combine the header into a single string
		local header_text = table.concat(header, "\n")

		-- Pipe the header through lolcat
		local handle = io.popen("echo " .. vim.fn.shellescape(header_text) .. " | lolcat", "r")
		local lolcat_header = handle:read("*a")
		handle:close()

		-- Split the lolcat output into lines
		local lolcat_lines = vim.split(lolcat_header, "\n")

		-- Set the lolcat header in the dashboard
		dashboard.section.header.val = lolcat_lines

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "🐱  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "🦦 > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "🌈 > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "🦊 > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "🦝  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", "💀 > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
