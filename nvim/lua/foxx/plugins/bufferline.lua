return {
  "akinsho/bufferline.nvim",
  version = "*", -- Ensures you always get the latest stable version
  dependencies = "nvim-tree/nvim-web-devicons", -- For file icons
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "ordinal", -- Show buffer index numbers
        diagnostics = "nvim_lsp", -- Show LSP diagnostics
        separator_style = "slant", -- Fancy separators (options: "slant", "padded_slant", "thick", etc.)
        show_close_icon = false, -- Optional: Remove close icon from tabs
        offsets = {
          {
            filetype = "NvimTree", -- Offset for file tree integration
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    })
  end,
}

