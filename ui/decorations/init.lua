local awful = require "awful"
local beautiful = require "beautiful"
local wibox = require "wibox"
require "ui.decorations.titlebar"

client.connect_signal('mouse::enter', function(c)
  c:activate { context = 'mouse_enter', raise = false }
end)

screen.connect_signal('request::wallpaper', function(s)
  awful.wallpaper {
    screen = s,
    widget = {
      {
        image     = beautiful.wallpaper,
        upscale   = true,
        downscale = true,
        widget    = wibox.widget.imagebox,
      },
      valign = 'center',
      halign = 'center',
      tiled = false,
      widget = wibox.container.tile,
    }
  }
end)

screen.connect_signal("request::desktop_decoration", function(s)
  tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
      awful.layout.suit.floating,
      awful.layout.suit.tile.left,
      awful.layout.suit.tile,
      awful.layout.suit.fair,
      awful.layout.suit.max,
    })
  end)

  awful.tag({ '1', '2', '3', '4', '5', '6' }, s, awful.layout.layouts[1])
end)
