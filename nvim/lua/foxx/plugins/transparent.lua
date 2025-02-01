return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup()

		-- Define keybindings
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Toggle transparency
		map("n", "<leader>tt", "<cmd>TransparentToggle<CR>", opts)
	end,
}
