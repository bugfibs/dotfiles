return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
        styles = {
          transparency = false,
          italic = false,
          bold = true,
        },
        highlight_groups = {
          Normal = { bg = "#000000" },
          NormalFloat = { bg = "#000000" },
          NormalNC = { bg = "#000000" },
        },
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
}
