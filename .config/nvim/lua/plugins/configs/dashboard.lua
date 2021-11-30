local g = vim.g

g.dashboard_custom_header = {
  '',
  '',
  '',
  '        ▀████▀▄▄              ▄█',
  '          █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█',
  '  ▄        █          ▀▀▀▀▄  ▄▀ ',
  ' ▄▀ ▀▄      ▀▄              ▀▄▀ ',
  '▄▀    █     █▀   ▄█▀▄      ▄█   ',
  '▀▄     ▀▄  █     ▀██▀     ██▄█  ',
  ' ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █ ',
  '  █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀ ',
  ' █   █  █      ▄▄           ▄▀  ',  
}

g.dashboard_default_executive = 'telescope'

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 0

g.dashboard_custom_section = {
   a = { description = { "  Find File                 SPC F F" }, command = "Telescope find_files" },
   b = { description = { "  Recents                   SPC F O" }, command = "Telescope oldfiles" },
   c = { description = { "  Find Word                 SPC F W" }, command = "Telescope live_grep" },
   d = { description = { "洛 New File                  SPC F N" }, command = "DashboardNewFile" },
   e = { description = { "  Bookmarks                 SPC B M" }, command = "DashboardJumpMarks" },
   f = { description = { "  Load Last Session         SPC S K" }, command = "SessionLoad" },
}
