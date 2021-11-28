local function map_wrapper(mode, lhs, rhs, options)
  local valid_modes = {
    [""] = true,
    ["n"] = true,
    ["v"] = true,
    ["s"] = true,
    ["x"] = true,
    ["o"] = true,
    ["!"] = true,
    ["i"] = true,
    ["l"] = true,
    ["c"] = true,
    ["t"] = true,
  }

  if type(lhs) == "table" then
    for _, key in ipairs(lhs) do
      map_wrapper(mode, key, rhs, options)
    end
  else
    if type(mode) == "table" then
      for _, m in ipairs(mode) do
         map_wrapper(m, lhs, rhs, options)
      end
    else
      if valid_modes[mode] and lhs and rhs then
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
      else
        mode, lhs, rhs = mode or "", lhs or "", rhs or ""
        print("Cannot set mapping [ mode = '" .. mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]")
      end
    end
  end
end

local map = function(mode, keys, cmd, opt)
   local options = { noremap = true, silent = true }
   
   if opt then
      options = vim.tbl_extend("force", options, opt)
   end 

   map_wrapper(mode, keys, cmd, options)
end

map("n", "<Esc>", ":noh <CR>")
map("n", "<C-s>", ":w <CR>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

map("n", "<C-n>", ":NvimTreeToggle <CR>")
map("n", "<leader>e", ":NvimTreeFocus <CR>")

map("n", "<TAB>", ":BufferLineCycleNext <CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev <CR>")

map({"n", "i"}, "<leader>f", ":PrettierAsync <CR>")

