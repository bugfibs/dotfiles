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
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                local map = {
                  NORMAL = "N",
                  INSERT = "I",
                  VISUAL = "V",
                  ["V-LINE"] = "VL",
                  ["V-BLOCK"] = "VB",
                  SELECT = "S",
                  ["S-LINE"] = "SL",
                  ["S-BLOCK"] = "SB",
                  REPLACE = "R",
                  ["V-REPLACE"] = "VR",
                  COMMAND = "C",
                  EX = "EX",
                  TERMINAL = "T",
                  ["O-PENDING"] = "OP",
                }
                return map[str] or str
              end,
            },
          },
          lualine_b = { "filename" },
          lualine_c = {},
          lualine_x = {},
          lualine_y = { "filetype" },
          lualine_z = { "location", "progress" },
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
