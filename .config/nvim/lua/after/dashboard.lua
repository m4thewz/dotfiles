local dashboard = require "alpha.themes.dashboard"
local section = dashboard.section

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "DashboardCenter"
  b.opts.hl_shortcut = "DashboardShortcut"
  b.opts.width = 40

  return b
end

local randomQuote = function()
  local quotes = {
    "Truly wonderful the mind of a child is. - Master Yoda",
    "Feel the force! - Master Yoda",
    "Disgusting KFC Chicken, I smell. - Master Yoda?",
    "You will find only what you bring in. - Master Yoda",
    "Give off light, or darkness, Padawan. Be a candle, or the night. - Master Yoda",
    "Size matters not. - Master Yoda",
    "Jeff Who? - Elon Musk",
    "do be do be do. - Scooby Do",
  }
  local randomic = math.random(#quotes)

  return quotes[randomic]
end

section.header.val = {
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
section.header.opts.hl = "DashboardHeader"

section.buttons.val = {
  button("SPC F F", " Find File", "<Cmd>Telescope find_files<CR>"),
  button("SPC F O", " Recents", "<Cmd>Telescope oldfiles<CR>"),
  button("SPC F W", " Find word", "<Cmd>Telescope live_grep<CR>"),
  button("SPC C C", " Update plugins", "<Cmd>PackerSync<CR>"),
  button("Q"      , " Quit", "<Cmd>qa<CR>")
}

section.footer.val = randomQuote
section.footer.opts.hl = "DashboardFooter"

require("alpha").setup({
  layout = {
    { type = "padding", val = 2 },
    section.header,
    { type = "padding", val = 2 },
    section.buttons,
    { type = "padding", val = 4 },
    section.footer,
  },
  opts = { margin = 5 }
})

vim.cmd [[
  augroup alpha_tabline
    au!
	  au OptionSet showtabline :set showtabline=1
  augroup END
]]

