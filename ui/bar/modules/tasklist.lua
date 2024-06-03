local awful = require "awful"
local wibox = require "wibox"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi

local create_tasklist = function(s)
  local base_width = dpi(4)
  local base_height = dpi(2)

  local tasklist_buttons = {
    awful.button {
      modifiers = {},
      button    = 1,
      on_press  = function(c)
        local cl_menu, client_num, client_list

        if cl_menu then
          cl_menu:hide()
          cl_menu = nil
        else
          client_num = 0
          client_list = {}
          for i, cl in pairs(client.get()) do
            if cl.class == c.class and awful.widget.tasklist.filter.currenttags(cl, s) then
              client_num = client_num + 1
              client_list[i] = { cl.name,
                function()
                  client.focus = cl
                  awful.tag.viewonly(cl:tags()[1])
                  cl:raise()
                end,
                cl.icon
              }
            end
          end

          if client_num > 1 then
            cl_menu = awful.menu({ items = client_list, theme = { width = 300 } })
            cl_menu:show()
          else
            client.focus = c
            awful.tag.viewonly(c:tags()[1])
            c:raise()
          end
        end
      end,
    },
    awful.button {
      modifiers = {},
      button    = 3,
      on_press  = function() awful.menu.client_list { theme = { width = 250 } } end
    },
    awful.button {
      modifiers = {},
      button    = 4,
      on_press  = function() awful.client.focus.byidx(-1) end
    },
    awful.button {
      modifiers = {},
      button    = 5,
      on_press  = function() awful.client.focus.byidx(1) end
    },
  }
  local tasklist = awful.widget.tasklist {
    screen          = s,
    filter          = function() return true end, -- filter in source
    source          = function()
      local cls = client.get()

      -- allow only one client per class
      local result = {}
      local class_seen = {}
      for _, c in pairs(cls) do
        if awful.widget.tasklist.filter.currenttags(c, s) then
          if not class_seen[c.class] then
            class_seen[c.class] = #result + 1
            table.insert(result, c)
          elseif client.focus == c then
            result[class_seen[c.class]] = c
          end
        end
      end
      return result
    end,
    buttons         = tasklist_buttons,
    layout          = {
      spacing_widget = {
        {
          forced_width  = 5,
          forced_height = 24,
          thickness     = 1,
          color         = beautiful.bg_light,
          widget        = wibox.widget.separator
        },
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
      },
      spacing        = 1,
      layout         = wibox.layout.fixed.horizontal
    },
    widget_template = {
      nil,
      {
        {
          {
            {
              id     = 'clienticon',
              widget = awful.widget.clienticon,
            },
            margins = { left = 5, top = 5, bottom = 5, right = 3 },
            widget  = wibox.container.margin
          },
          id = "icon_margin_role",
          widget = wibox.container.margin,
        },
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
      },
      {
        layout = wibox.container.place,
        {
          wibox.widget.base.make_widget(),
          id = 'background_role',
          forced_width = base_width,
          forced_height = base_height,
          widget = wibox.container.background,
        }
      },
      create_callback = function(self, c)
        local bg_widget = self:get_children_by_id 'background_role'[1]
        self:get_children_by_id('clienticon')[1].client = c

        function self.update()
          if client.focus == c then
            bg_widget.forced_width = dpi(30)
          else
            bg_widget.forced_width = base_width
          end
        end
      end,
      update_callback = function(self)
        self.update()
      end,
      layout = wibox.layout.align.vertical,
    },
  }

  return tasklist
end

return create_tasklist
