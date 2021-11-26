local ok, tree = pcall(require, "nvim-tree")
local g = vim.g

if not ok then
  return
end

-- Init tree

tree.setup {
   diagnostics = {
    enable = true,
    icons = {
       hint    = "",
       info    = "",
       warning = "",
       error   = "",
    },
   },
   filters = {
    dotfiles = false,
    custom = { ".git", "node_modules", ".cache" }
   },
   disable_netrw      = true,
   hijack_netrw       = true,
   ignore_ft_on_setup = { "dashboard" },
   auto_close         = false,
   open_on_tab        = false,
   hijack_cursor      = true,
   update_cwd         = true,
   update_focused_file = {
    enable     = true,
    update_cwd = false,
   },
   view = {
    allow_resize = true,
    side         = "left",
    width        = 30,
  },
}

g.nvim_tree_add_trailing           = 0
g.nvim_tree_git_hl                 = 1
g.nvim_tree_gitignore              = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_indent_markers         = 1
g.nvim_tree_quit_on_open           = 1
g.nvim_tree_root_folder_modifier   = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

g.nvim_tree_show_icons = {
  folders = 1,
  files   = 1,
  git     = 1,
}

g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted   = "",
      ignored   = "◌",
      renamed   = "➜",
      staged    = "✓",
      unmerged  = "",
      unstaged  = "✗",
      untracked = "?",
   },
   folder = {
      default      = "",
      empty        = "",
      empty_open   = "",
      open         = "",
      symlink      = "",
      symlink_open = "",
   },
}
