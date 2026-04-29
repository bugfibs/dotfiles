return {
  -- Detect tabstop and shiftwidth automatically
  "NMAC427/guess-indent.nvim",

  -- Practice vim motions
  "ThePrimeagen/vim-be-good",

  -- Auto-pair brackets and quotes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Highlight TODO, FIXME, etc. in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
}
