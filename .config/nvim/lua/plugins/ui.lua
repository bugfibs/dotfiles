return {
  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = vim.g.have_nerd_font,
          theme = {
            normal = {
              a = { bg = "#000000", fg = "#cccccc" },
              b = { bg = "#000000", fg = "#cccccc" },
              c = { bg = "#000000", fg = "#cccccc" },
              x = { bg = "#000000", fg = "#cccccc" },
              y = { bg = "#000000", fg = "#cccccc" },
              z = { bg = "#000000", fg = "#cccccc" },
            },
            inactive = {
              a = { bg = "#000000", fg = "#666666" },
              b = { bg = "#000000", fg = "#666666" },
              c = { bg = "#000000", fg = "#666666" },
              x = { bg = "#000000", fg = "#666666" },
              y = { bg = "#000000", fg = "#666666" },
              z = { bg = "#000000", fg = "#666666" },
            },
          },
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename", "diagnostics" },
          lualine_x = { "encoding" },
          lualine_y = { "filetype" },
          lualine_z = { "progress", "location" },
        },
      })
    end,
  },
  -- Better text objects, surround, etc.
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup()
    end,
  },
}
