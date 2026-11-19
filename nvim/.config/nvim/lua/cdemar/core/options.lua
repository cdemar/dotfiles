vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- indentation (2 spaces, matches Prettier)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.wrap = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.winborder = "rounded" -- borders on hover docs and other floating windows

-- behavior
opt.clipboard = "unnamedplus" -- share the system clipboard
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false
opt.undofile = true -- undo history survives closing the file
opt.autoread = true -- reload files changed outside Neovim (Claude Code edits)
opt.timeoutlen = 300
opt.updatetime = 250
