return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle file [E]xplorer" },
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("neo-tree").setup({
        sources = { "filesystem", "git_status" },
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,

        default_component_configs = {
          indent = {
            with_markers = true,
            with_expanders = true,
          },
          git_status = {
            symbols = {
              added = "+",
              modified = "~",
              deleted = "-",
              renamed = "→",
              untracked = "?",
              ignored = "i",
              unstaged = "u",
              staged = "s",
              conflict = "!",
            },
          },
        },

        window = {
          position = "left",
          width = 30,
          mappings = {
            ["<space>"] = "none",
            ["s"] = "open_split",
            ["v"] = "open_vsplit",
            ["gf"] = function()
              vim.cmd("Neotree filesystem")
            end,
            ["gg"] = function()
              vim.cmd("Neotree git_status")
            end,
          },
        },

        filesystem = {
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_pattern = {
              "*.class",
            },
          },
        },

        git_status = {
          window = {
            position = "left",
          },
        },
      })
    end,
  },
}
