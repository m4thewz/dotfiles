local o = vim.o
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   vim.g["loaded_" .. plugin] = 1
end

vim.api.nvim_command 'syntax on'
vim.g.mapleader = " "

o.title = true

o.termguicolors = true
o.clipboard = "unnamedplus"
o.completeopt = "menuone,noselect"
o.mouse = "a"
o.cursorline = true
o.cul = true
o.number = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.undofile = true
o.updatetime = 250

vim.opt.whichwrap:append "<>[]hl"

vim.cmd [[autocmd BufEnter,BufWinEnter,FileType,WinEnter * if @% == 'NvimTree' | set laststatus=0 | else | set laststatus=2 | endif]]

