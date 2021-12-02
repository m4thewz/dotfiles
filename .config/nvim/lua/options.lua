local o = vim.o

vim.api.nvim_command 'syntax on'

vim.g.mapleader = " "
o.title = true

o.termguicolors = true
o.clipboard = "unnamedplus"
o.completeopt = "menuone,noselect"

o.cursorline = true
o.cul = true
o.number = true

o.tabstop    = 2
o.shiftwidth = 2
o.expandtab  = true

o.undofile = true
o.updatetime = 250


