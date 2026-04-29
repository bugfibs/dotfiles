-- General editor options
-- See `:help vim.o` and `:help option-list` for everything available

-- Leader keys must be set before plugins load
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Nerd Font is installed and selected in the terminal
vim.g.have_nerd_font = true

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Mouse support (useful for resizing splits)
vim.o.mouse = "a"

-- Mode is shown in the statusline, don't duplicate it
vim.o.showmode = false

-- Indentation: 4-space soft tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Sync clipboard with OS (scheduled to avoid startup delay)
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true
vim.o.undofile = true

-- Case-insensitive search unless \C or capitals are used
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- New splits open to the right and below
vim.o.splitright = true
vim.o.splitbelow = true

-- Show trailing whitespace
vim.o.list = true
vim.opt.listchars = { trail = "·" }

-- Live preview of :s substitutions
vim.o.inccommand = "split"

vim.o.cursorline = true
vim.o.scrolloff = 10

-- Confirm dialog instead of failing on unsaved changes
vim.o.confirm = true
