local wibox = require "wibox"
local beautiful = require "beautiful"
local helpers = require "helpers"
local dpi = beautiful.xresources.apply_dpi

local toggle_arrow = helpers.textbox(beautiful.fg, beautiful.icon_font .. 12, '')

local tray_toggle = helpers.margin(
  toggle_arrow, 5, 5, 5, 5
)

local systray = wibox.widget {
  wibox.widget.systray(),
  widget  = wibox.container.margin,
  left    = dpi(5),
  top     = dpi(5),
  bottom  = dpi(5),
  visible = false,
}

local togglableSystray = wibox.widget {
  {
    {
      systray,
      tray_toggle,
      layout = wibox.layout.fixed.horizontal,
    },
    widget = wibox.container.background,
    bg     = beautiful.bg_dark,
    shape  = helpers.rrect(dpi(5))
  },
  left   = dpi(3),
  right  = dpi(0),
  top    = dpi(3),
  bottom = dpi(3),
  widget = wibox.container.margin
}

tray_toggle:connect_signal("button::press", function(_, _, _, button)
  if button == 1 then
    systray.visible = not systray.visible
    if systray.visible then
      toggle_arrow.markup = helpers.mtext(beautiful.fg, beautiful.icon_font .. 12, '')
    else
      toggle_arrow.markup = helpers.mtext(beautiful.fg, beautiful.icon_font .. 12, '')
    end
  end
end)


return togglableSystray
