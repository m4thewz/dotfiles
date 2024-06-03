local awful = require "awful"
local wibox = require "wibox"
local beautiful = require "beautiful"
local helpers = require "helpers"
local dpi = beautiful.xresources.apply_dpi

-- i like the english format

local function get_en_date()
  local handle = io.popen("LC_TIME=en_US.UTF-8 TZ=America/Sao_Paulo date +'%A - %B %d, %Y'")
  local result = handle:read("*a")
  handle:close()
  return result:gsub("\n", "")
end

local button = function(name, icon, clr, command)
  local btn = wibox.widget {
    {
      {
        {
          id = 'text_role',
          align = 'center',
          font = beautiful.icon_font .. 25,
          markup = helpers.colorizeText(icon, clr),
          widget = wibox.widget.textbox
        },
        margins = 40,
        widget = wibox.container.margin
      },
      shape = helpers.rrect(dpi(15)),
      forced_height = dpi(150),
      forced_width = dpi(150),
      border_width = 3,
      border_color = clr,
      buttons = {
        awful.button({}, 1, function()
          if type(command) == "string" then
            awesome.emit_signal("powermenu:hide")
            awful.spawn(command)
          else
            command()
          end
        end)
      },
      bg = beautiful.bg_dark,
      widget = wibox.container.background
    },
    {
      id = 'text_role',
      align = 'center',
      font = beautiful.font_name .. "Bold 16",
      markup = helpers.colorizeText(name, beautiful.fg),
      widget = wibox.widget.textbox
    },
    spacing = 20,
    layout = wibox.layout.fixed.vertical
  }
  return btn
end

local shutdown_button = button("Poweroff", "󰐥", beautiful.red, "shutdown now")
local reboot_button = button("Restart", "󰜉", beautiful.orange, "reboot")
local suspend_button = button("Sleep", "󰤄", beautiful.yellow, "systemctl suspend")
local lock_button = button("Lock", "󰍁", beautiful.lightblue, "dm-tool lock")
local logout_button = button("Exit", "󰈆", beautiful.purple, function() awesome.quit() end)

local powermenu_top = wibox.widget {
  {
    {
      widget = wibox.widget.imagebox,
      image = beautiful.profile_pic,
      forced_height = 50,
      forced_width = 50,
      resize = true,
      align = "center",
      valign = "center",
      clip_shape = helpers.rrect(50),
    },
    nil,
    {
      {
        font = beautiful.icon_font .. 15,
        text = "󰅖",
        align = "center",
        buttons = {
          awful.button({}, 1, function()
            awesome.emit_signal("powermenu:hide")
          end)
        },
        widget = wibox.widget.textbox,
      },
      forced_width = 50,
      forced_height = 50,
      shape = helpers.rrect(25),
      bg = beautiful.bg_dark,
      fg = beautiful.red,
      widget = wibox.container.background
    },
    layout = wibox.layout.align.horizontal
  },
  margins = dpi(10),
  widget = wibox.container.margin
}
local powermenu_center = wibox.widget {
  {
    {
      {
        font = beautiful.font_name .. "Bold 112",
        format = helpers.colorizeText("%H:%M", beautiful.fg),
        align = "center",
        widget = wibox.widget.textclock
      },
      {
        {
          font = beautiful.font_name .. "Bold 18",
          markup = helpers.colorizeText(get_en_date(), beautiful.fg),
          align = "center",
          widget = wibox.widget.textbox
        },
        bottom = dpi(20),
        widget = wibox.container.margin
      },
      {
        shutdown_button,
        reboot_button,
        suspend_button,
        lock_button,
        logout_button,
        spacing = dpi(30),
        layout = wibox.layout.fixed.horizontal
      },
      layout = wibox.layout.align.vertical
    },
    align = "center",
    widget = wibox.container.place,
  },
  layout = wibox.layout.align.vertical
}

awful.screen.connect_for_each_screen(function(s)
  local powermenu_container = wibox {
    screen = s,
    type = "splash",
    visible = false,
    ontop = true,
    bg = beautiful.bg_dark .. "10",
    height = s.geometry.height,
    width = s.geometry.width,
    x = s.geometry.x,
    y = s.geometry.y
  }
  local wall = wibox.widget {
    id = "bg",
    image = beautiful.wallpaper,
    widget = wibox.widget.imagebox,
    height = s.geometry.height,
    width = s.geometry.width,
    horizontal_fit_policy = "fit",
    vertical_fit_policy = "fit",
  }

  powermenu_container:setup {
    wall,
    {
      powermenu_top,
      {
        {
          powermenu_center,
          align = "center",
          widget = wibox.container.place,
        },
        top = -125,
        widget = wibox.container.margin
      },
      layout = wibox.layout.align.vertical
    },
    layout = wibox.layout.stack
  }

  local cmd_tbl = {
    ["p"] = "shutdown now",
    ["r"] = "reboot",
    ["s"] = "systemctl suspend",
    ["l"] = "dm-tool lock",
  }
  local powermenu_keygrabber = awful.keygrabber {
    autostart = false,
    stop_event = 'release',
    keypressed_callback = function(_, _, key)
      if key == 'Escape' or key == "q" then
        awesome.emit_signal("powermenu:hide")
      elseif key == "e" then
        awesome.emit_signal("powermenu:hide")
        awesome.quit()
      elseif cmd_tbl[key] then
        awesome.emit_signal("powermenu:hide")
        awful.spawn(cmd_tbl[key])
      end
    end
  }
  local wall_location = os.getenv("HOME") .. "/.cache/awesome/blur/wall"
  local file = io.open(wall_location, "r")
  if file then
    file:close()
  else
    os.execute("mkdir -p ~/.cache/awesome/blur/")
    local cmd = 'convert ' .. beautiful.wallpaper .. ' -modulate 75 -blur 0x10 ~/.cache/awesome/blur/wall'
    awful.spawn.easy_async_with_shell(cmd)
  end
  wall.image = wall_location

  awesome.connect_signal(
    "powermenu:show",
    function()
      powermenu_container.visible = true
      powermenu_keygrabber:start()
    end
  )

  awesome.connect_signal(
    "powermenu:hide",
    function()
      powermenu_keygrabber:stop()
      powermenu_container.visible = false
    end
  )
end)
