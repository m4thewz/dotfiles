-- Disable distribution plugins

vim.tbl_map(
  function(p)
    vim.g['loaded_' .. p] = 0
  end, {
  'gzip',
  'tar',
  'tarPlugin',
  'zip',
  'zipPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  'matchit',
  'matchparen',
  '2html_plugin',
  'logiPat',
  'rrhelper',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers'
})

local map = function(mode, keys, command, opt)
   local options = { noremap = true, silent = true }

   if opt then
      options = vim.tbl_extend("force", options, opt)
   end

  vim.api.nvim_set_keymap(mode, keys, command, options)
end

map("n", "<Esc>", ":noh <CR>")
map("n", "<C-s>", ":w <CR>")
map("n", "q", ":q <CR>")
map("n", "<leader>cc", ":PackerSync <CR>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

map("n", "<C-n>", ":NvimTreeToggle <CR>")

map("n", "<TAB>", ":BufferLineCycleNext <CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev <CR>")

map("n", "<leader>ff", ":Telescope find_files <CR>")
map("n", "<leader>fw", ":Telescope live_grep <CR>")
map("n", "<leader>fo", ":Telescope oldfiles <CR>")

map("n", "<leader>bm", ":DashboardJumpMarks <CR>")
map("n", "<leader>fn", ":DashboardNewFile <CR>")
map("n", "<leader>db", ":Dashboard <CR>")
map("n", "<leader>sl", ":SessionLoad <CR>")

map("n", "<leader>/", ":CommentToggle <CR>")
map("v", "<leader>/", ":CommentToggle <CR>")

