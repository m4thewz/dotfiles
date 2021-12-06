local map = function(mode, keys, command, opt)
   local options = { noremap = true, silent = true }

   if opt then options = vim.tbl_extend("force", options, opt) end

  vim.api.nvim_set_keymap(mode, keys, command, options)
end

map("n", "<Esc>", ":noh <CR>")
map("n", "<C-s>", ":w <CR>")
map("n", "q", ":q <CR>")
map("n", "<leader>cc", ":PackerSync <CR>")
map("n", "<C-w>", ":lua require('utils').close_buf() <CR>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

map("n", "<C-n>", ":NvimTreeToggle <CR>")

map("n", "<TAB>", ":BufferLineCycleNext <CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev <CR>")

map("n", "<leader>/", ":CommentToggle <CR>")
map("v", "<leader>/", ":CommentToggle <CR>")

