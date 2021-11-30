local g = vim.g

g.dashboard_preview_command = 'cat'
g.dashboard_preview_pipeline = 'lolcat'
g.dashboard_preview_file = '~/.config/nvim/neovim.cat'

g.dashboard_preview_file_height = 20
g.dashboard_preview_file_width = 40
g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1

g.dashboard_custom_section = {
   a = { description = { "  " }, command = " " },
}

g.dashboard_custom_footer = {
   "   ",
}
