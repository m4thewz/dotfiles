local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local beautiful = require "beautiful"

local helpers = require "helpers"
local dpi = beautiful.xresources.apply_dpi

local modkey = "Mod4"


local create_taglist = function(s)
  local taglist_buttons = gears.table.join(
    awful.button({}, 1,
      function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
      if client.focus then client.focus:move_to_tag(t) end
    end), awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
      if client.focus then client.focus:toggle_tag(t) end
    end), awful.button({}, 4, function(t)
      awful.tag.viewnext(t.screen)
    end), awful.button({}, 5, function(t)
      awful.tag.viewprev(t.screen)
    end))



  local update_tag = function(self, c3, _)
    if c3.selected then
      self:get_children_by_id('tags')[1].markup = helpers.mtext(beautiful.blue, beautiful.icon_font .. 12, '󰄯')
    elseif #c3:clients() == 0 then
      self:get_children_by_id('tags')[1].markup = helpers.mtext(beautiful.mid_light, beautiful.icon_font .. 12, '󰄰')
    else
      self:get_children_by_id('tags')[1].markup = helpers.mtext(beautiful.mid_light, beautiful.icon_font .. 12, '󰪥')
    end
  end

  local taglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    layout = { layout = wibox.layout.fixed.horizontal, spacing = dpi(14), shape = gears.shape.circle },
    style = { font = beautiful.icon_font .. 12 },
    widget_template = {
      id = 'tags',
      widget = wibox.widget.textbox,
      markup = helpers.mtext(beautiful.mid_light, beautiful.icon_font .. 12, '󰄰'),
      forced_width = dpi(26),
      create_callback = function(self, c3, _)
        update_tag(self, c3, _)
      end,
      update_callback = function(self, c3, _)
        update_tag(self, c3, _)
      end,
    },

    buttons = taglist_buttons
  }

  local the_taglist = helpers.margin(wibox.widget
    {
      {
        {
          nil,
          layout = wibox.layout.align.horizontal,
          taglist,
          expand = 'none'
        },
        widget = wibox.container.margin,
        left = dpi(10),
        right = dpi(5)
      },
      widget = wibox.container.background,
      bg = beautiful.black,
      shape = helpers.rrect(dpi(5))
    },
    3, 6, 4, 4)

  return the_taglist
end

return create_taglist
