local awful = require "awful"
local wibox = require "wibox"
require "awful.autofocus"

client.connect_signal('request::titlebars', function(c)
  local buttons = {
    awful.button {
      modifiers = {},
      button    = 1,
      on_press  = function()
        c:activate { context = 'titlebar', action = 'mouse_move' }
      end
    },
    awful.button {
      modifiers = {},
      button    = 3,
      on_press  = function()
        c:activate { context = 'titlebar', action = 'mouse_resize' }
      end
    },
  }

  local titlebar = awful.titlebar(c)
  awful.titlebar.enable_tooltip = false
  titlebar.widget = {
    {
      {
        {
          widget = wibox.container.constraint,
          strategy = 'exact',
          width = require 'beautiful'.xresources.apply_dpi(25),
          awful.titlebar.widget.iconwidget(c),
        },
        margins = { left = require 'beautiful'.xresources.apply_dpi(5) },
        layout  = wibox.container.margin,
      },
      -- {
      --   align = 'center',
      --   font = beautiful.font,
      --   widget = awful.titlebar.widget.titlewidget(c),
      -- },
      layout = wibox.layout.fixed.horizontal,
      buttons = buttons,
      spacing = 10
    },
    nil,
    {
      awful.titlebar.widget.minimizebutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.closebutton(c),

      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal,
  }
end)
