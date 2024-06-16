local awful = require("awful")
require "ui.decorations"
require "ui.bar"
require "ui.notifications"
require "ui.powermenu"

local calendar = require("ui.bar.modules.calendar")
awful.screen.connect_for_each_screen(function(s)
  calendar(s)
end)
