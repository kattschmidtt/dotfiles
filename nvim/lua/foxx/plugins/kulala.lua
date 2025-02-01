return {
	"mistweaverco/kulala.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required dependency
	},
	config = function()
		local kulala = require("kulala")

		-- Set up kulala.nvim with default settings
		kulala.setup()

		-- Define keybindings
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Save the current session
		map("n", "<leader>ss", "<cmd>KulalaSaveSession<CR>", opts)

		-- Load a session
		map("n", "<leader>sl", "<cmd>KulalaLoadSession<CR>", opts)

		-- Delete a session
		map("n", "<leader>sd", "<cmd>KulalaDeleteSession<CR>", opts)

		-- List all sessions
		map("n", "<leader>sL", "<cmd>KulalaListSessions<CR>", opts)
	end,
}
