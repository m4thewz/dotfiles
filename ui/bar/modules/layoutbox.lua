local awful = require "awful"
local gears = require "gears"
local helpers = require "helpers"
local wibox = require "wibox"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi

local layoutbox = wibox.widget {
  {
    {
      {
        awful.widget.layoutbox(),
        widget = wibox.container.place
      },
      left = dpi(5),
      right = dpi(5),
      forced_width = dpi(34),
      widget = wibox.container.margin
    },
    bg = beautiful.black,
    shape = helpers.rrect(dpi(5)),
    widget = wibox.container.background,
  },
  top = dpi(5),
  bottom = dpi(5),
  right = dpi(5),
  widget = wibox.container.margin
}
layoutbox:buttons(gears.table.join(
  awful.button({}, 1, function()
    awful.layout.inc(1)
  end),
  awful.button({}, 3, function()
    awful.layout.inc(-1)
  end),
  awful.button({}, 4, function()
    awful.layout.inc(1)
  end),
  awful.button({}, 5, function()
    awful.layout.inc(-1)
  end)
))
return layoutbox
