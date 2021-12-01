local g, o, api, cmd = vim.g, vim.o, vim.api, vim.api.nvim_command

cmd 'syntax on'
o.termguicolors = true

o.clipboard = "unnamedplus"

o.completeopt = 'menuone'

o.cursorline = true
o.number = true
g.mapleader = " "

o.tabstop    = 2 
o.shiftwidth = 2
o.expandtab  = true

o.undofile = true
o.updatetime = 250

-- Disable distribution plugins

g.loaded_gzip              = 1
g.loaded_tar               = 1
g.loaded_tarPlugin         = 1
g.loaded_zip               = 1
g.loaded_zipPlugin         = 1
g.loaded_getscript         = 1
g.loaded_getscriptPlugin   = 1
g.loaded_vimball           = 1
g.loaded_vimballPlugin     = 1
g.loaded_matchit           = 1
g.loaded_matchparen        = 1
g.loaded_2html_plugin      = 1
g.loaded_logiPat           = 1
g.loaded_rrhelper          = 1
g.loaded_netrw             = 1
g.loaded_netrwPlugin       = 1
g.loaded_netrwSettings     = 1
g.loaded_netrwFileHandlers = 1

