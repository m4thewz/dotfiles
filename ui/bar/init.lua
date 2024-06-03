local awful = require "awful"
local wibox = require "wibox"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi

local systray = require "ui.bar.modules.systray"
local clock = require "ui.bar.modules.clock"
local layoutbox = require "ui.bar.modules.layoutbox"

awful.screen.connect_for_each_screen(function(s)
  local taglist = require("ui.bar.modules.taglist")(s)
  local tasklist = require("ui.bar.modules.tasklist")(s)

  s.bar = awful.wibar({
    position = 'bottom',
    screen   = s,
    visible  = true,
    type     = "dock",
    bg       = beautiful.bg_dark,
    height   = dpi(40),
  })
  s.bar:struts({ bottom = 40 })
  s.bar:setup({
    {
      {
        nil,
        {
          taglist,
          tasklist,
          layout = wibox.layout.fixed.horizontal
        },
        {
          systray,
          clock,
          {
            layoutbox,
            wibox.widget {
              {
                {
                  font = beautiful.icon_font .. 12,
                  text = "",
                  align = "center",
                  valign = "center",
                  forced_width = dpi(25),
                  widget = wibox.widget.textbox
                },
                margins = 3,
                right = 5,
                widget = wibox.container.margin
              },
              widget = wibox.container.background,
              fg = beautiful.red,
              buttons = {
                awful.button({}, 1, function()
                  awesome.emit_signal('powermenu:show')
                end)
              },
            },
            layout = wibox.layout.fixed.horizontal
          },
          layout = wibox.layout.fixed.horizontal
        },
        layout = wibox.layout.align.horizontal
      },
      layout = wibox.layout.stack
    },
    widget = wibox.container.background,
    bg = beautiful.black,
  })
end)
