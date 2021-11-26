local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
   return
end

gitsigns.setup {
  sign_priority = 5,
  signs = {
    add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
    changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
  },
}
