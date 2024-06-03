local gears = require "gears"
local wibox = require "wibox"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi

local helpers = {}

helpers.rrect = function(radius)
  return function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, radius)
  end
end

helpers.mtext = function(color, font, text)
  return '<span color="' .. color .. '" font="' .. font .. '">' .. text .. '</span>'
end

helpers.textbox = function(color, font, text)
  return wibox.widget {
    markup = '<span color="' .. color .. '" font="' .. font .. '">' .. text .. '</span>',
    widget = wibox.widget.textbox
  }
end

helpers.colorizeText = function(txt, fg)
  return "<span foreground='" .. (fg or beautiful.fg) .. "'>" .. txt .. "</span>"
end
helpers.imagebox = function(img, height, width)
  return wibox.widget {
    image = img,
    resize = true,
    forced_height = dpi(height),
    forced_width = dpi(width),
    widget = wibox.widget.imagebox
  }
end

helpers.margin = function(wgt, ml, mr, mt, mb)
  return wibox.widget {
    wgt,
    widget = wibox.container.margin,
    left = dpi(ml),
    right = dpi(mr),
    top = dpi(mt),
    bottom = dpi(mb),
  }
end

return helpers
