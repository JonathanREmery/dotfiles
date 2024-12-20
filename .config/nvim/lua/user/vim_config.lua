-- No Arrows!
vim.cmd([[map <Up> <Nop>]])
vim.cmd([[map <Down> <Nop>]])
vim.cmd([[map <Left> <Nop>]])
vim.cmd([[map <Right> <Nop>]])

-- Set Leader to <Space>
vim.g.mapleader = " "

-- Line Numbering
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab Spacing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Text Wrapping
vim.opt.wrap = false

-- Terminal Coloring
vim.opt.termguicolors = true

-- Clear Search Highlighting
vim.keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear Search Highlighting", silent = true })

-- Prevevent Width Shifting
vim.opt.signcolumn = "yes"

-- Enable Mouse Events
vim.o.mousemoveevent = true

-- Global Status Line
vim.opt.laststatus = 3
