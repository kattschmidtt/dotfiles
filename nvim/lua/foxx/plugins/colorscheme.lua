return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			-- Set the color scheme to mocha
			require("catppuccin").setup({
				flavour = "frappe", -- specify the flavour here
				background = { -- optional, set background light/dark
					light = "latte",
					dark = "frappe",
				},
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
