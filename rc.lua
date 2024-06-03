local beautiful = require "beautiful"
local awful = require "awful"

-- errors
require("naughty").connect_signal("request::display_error", function(message, startup)
  require("naughty").notification {
    urgency = "critical",
    title   = "Error" .. (startup and " during startup!" or "!"),
    message = message
  }
end)

-- load theme
beautiful.init('~/.config/awesome/config/theme.lua')

require "config"
require "ui"

-- autostart
awful.spawn.with_shell("~/.config/awesome/autostart")
