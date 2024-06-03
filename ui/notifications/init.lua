local awful = require "awful"
local wibox = require "wibox"
local ruled = require "ruled"
local naughty = require "naughty"
local helpers = require "helpers"
local dpi = require("beautiful").xresources.apply_dpi
local beautiful = require("beautiful")

-- Config
naughty.config.defaults.ontop = true
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.border_width = 1
naughty.config.defaults.border_color = beautiful.bg_light
naughty.config.defaults.position = "bottom_right"
naughty.config.defaults.title = "Notification"

-- Rules
ruled.notification.connect_signal('request::rules', function()
  ruled.notification.append_rule {
    rule       = { urgency = 'critical' },
    properties = { bg = beautiful.bg, fg = beautiful.orange, timeout = 0 }
  }
  ruled.notification.append_rule {
    rule       = { urgency = 'normal' },
    properties = { bg = beautiful.bg, fg = beautiful.fg, timeout = 5 }
  }
  ruled.notification.append_rule {
    rule       = { urgency = 'low' },
    properties = { bg = beautiful.bg, fg = beautiful.fg, timeout = 5 }
  }
end)

-- Notification
naughty.connect_signal("request::display", function(n)
  naughty.layout.box {
    notification = n,
    type = "notification",
    bg = beautiful.bg,
    widget_template = {
      {
        {
          {
            {
              {
                {
                  {
                    {
                      {
                        text = n.title,
                        font = beautiful.font_name .. 12,
                        widget = wibox.widget.textbox,
                      },
                      strategy = "min",
                      widget = wibox.container.constraint
                    },
                    width = dpi(500),
                    widget = wibox.container.constraint
                  },
                  forced_height = dpi(20),
                  layout = wibox.layout.align.horizontal
                },
                margins = 10,
                widget = wibox.container.margin
              },
              bg = beautiful.bg_dark,
              widget = wibox.container.background
            },
            strategy = "min",
            widget = wibox.container.constraint
          },
          strategy = "max",
          widget = wibox.container.constraint
        },
        {

          naughty.widget.icon,
          {
            {
              {
                {
                  naughty.widget.message,
                  margins = 10,
                  widget = wibox.container.margin
                },
                strategy = "min",
                widget = wibox.container.constraint
              },
              width = dpi(500),
              widget = wibox.container.constraint
            },
            -- action list
            {
              {
                base_layout = wibox.widget {
                  spacing = 10,
                  layout = wibox.layout.fixed.horizontal,
                },
                widget_template = {
                  {
                    {
                      id     = "text_role",
                      widget = wibox.widget.textbox
                    },
                    widget = wibox.container.place
                  },
                  shape = helpers.rrect(3),
                  bg = beautiful.blue,
                  widget = wibox.container.background,
                },
                widget = naughty.list.actions,
              },
              widget = wibox.container.margin,
              margins = { left = 10, right = 10, bottom = 10 },
            },
            layout = wibox.layout.align.vertical
          },
          layout = wibox.layout.align.horizontal
        },
        layout = wibox.layout.align.vertical
      },
      id = "background_role",
      forced_width = dpi(500),
      height = dpi(130),
      widget = naughty.container.background
    }
  }
end)
-- naughty.notify {
--   title = "Boa pra nois rapaziada",
--   message = "Boa rapaziada esse texto eu to escrevendo sem saber o que to escrevendo entao nao sei oq to fazendo",
--   image = gears.surface("/home/mathias/Downloads/foto_cortada.png"),
--   actions = {
--     naughty.action { name = "Enviar" },
--     naughty.action { name = "Deletar" }
--   }
-- }
