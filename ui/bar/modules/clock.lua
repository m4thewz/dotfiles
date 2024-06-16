local awful = require "awful"
local wibox = require "wibox"
local helpers = require "helpers"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi

local clock = wibox.widget {
  {
    {
      {
        font = beautiful.font_name .. "Bold 14",
        format = "%H:%M",
        align = "center",
        valign = "center",
        widget = wibox.widget.textclock
      },
      widget = wibox.container.place,
      valign = "center"
    },
    margins = { left = dpi(10), right = dpi(10) },
    widget = wibox.container.margin
  },
  bg = beautiful.black,
  fg = beautiful.fg,
  buttons = {
    awful.button({}, 1, function()
      awesome.emit_signal('calendar::toggle')
    end)
  },
  widget = wibox.container.background,
  shape = helpers.rrect(dpi(2)),
}

return clock
