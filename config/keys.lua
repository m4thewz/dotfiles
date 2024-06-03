local awful = require "awful"
local mod = "Mod4"
local alt = "Mod1"
local home = os.getenv("HOME")

local function sendToSpotify(command)
  return function()
    awful.util.spawn_with_shell(
      "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player." ..
      command)
  end
end

client.connect_signal("request::default_mousebindings", function()
  awful.mouse.append_client_mousebindings({
    awful.button({ mod }, 1, function(c)
      c:activate { context = "mouse_click", action = "mouse_move" }
    end),
    awful.button({ mod }, 3, function(c)
      c:activate { context = "mouse_click", action = "mouse_resize" }
    end),
  })
end)

awful.keyboard.append_global_keybindings({
  -- Awesome
  awful.key(
    { mod, "Shift" }, "r",
    awesome.restart,
    { description = "reload awesome", group = "awesome" }
  ),
  awful.key(
    { mod }, "z", function()
      awful.layout.inc(1)
    end,
    { description = "next layout", group = "awesome" }
  ),
  awful.key(
    { mod, "Shift" }, "z", function()
      awful.layout.inc(-1)
    end,
    { description = "previous layout", group = "awesome" }
  ),
  awful.key(
    { alt }, "Tab", function()
      awful.client.focus.byidx(1)
    end,
    { description = "next window", group = "awesome" }
  ),
  awful.key(
    { alt, "Shift" }, "Tab", function()
      awful.client.focus.byidx(-1)
    end,
    { description = "previous window", group = "awesome" }
  ),
  awful.key(
    { mod }, "space", function()
      awful.util.spawn("rofi -show drun  -theme " .. home .. "/.config/rofi/launcher.rasi")
    end,
    { description = "show menu", group = "awesome" }
  ),
  awful.key(
    { mod }, "d", function()
      awesome.emit_signal("widget::launcher")
    end,
    { description = "show launcher", group = "awesome" }
  ),
  awful.key(
    { mod, "Shift" }, "c", function()
      awesome.emit_signal("widget::config")
    end,
    { description = "show config", group = "awesome" }
  ),

  -- Programs
  awful.key(
    { mod }, "Return", function()
      awful.spawn.with_shell("kitty")
    end,
    { description = "open a terminal", group = "programs" }
  ),
  awful.key(
    { mod }, "p", function()
      awesome.emit_signal("powermenu:show")
    end,
    { description = "kill picom", group = "programs" }
  ),
  awful.key(
    {}, "Print", function() awful.spawn.with_shell("flameshot gui") end,
    { description = "print screen", group = "programs" }
  ),
  -- Multimedia keys
  awful.key({}, "XF86AudioPrev", sendToSpotify("Previous"), { description = "previous", group = "volume" }),
  awful.key({}, "XF86AudioNext", sendToSpotify("Next"), { description = "next", group = "volume" }),
  awful.key({}, "XF86AudioPlay", sendToSpotify("PlayPause"), { description = "toggle play pause", group = "volume" }),
  awful.key({}, "XF86AudioStop", sendToSpotify("Pause"), { description = "stop audio", group = "volume" }),
  awful.key(
    {}, "XF86AudioRaiseVolume", function()
      awful.spawn.with_shell("pactl set-sink-volume @DEFAULT_SINK@ +5%")
    end,
    { description = "raise volume", group = "volume" }
  ),
  awful.key(
    {}, "XF86AudioLowerVolume", function()
      awful.spawn.with_shell("amixer set Master -5%")
    end,
    { description = "lower volume", group = "volume" }
  ),
  awful.key(
    {}, "XF86AudioMute", function()
      awful.spawn.with_shell("pactl set-sink-mute 0 toggle")
    end,
    { description = "mute volume", group = "volume" }
  ),

  -- Tag
  awful.key {
    modifiers   = { mod },
    keygroup    = "numrow",
    description = "only view tag",
    group       = "tag",
    on_press    = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  },
  awful.key {
    modifiers   = { mod, "Control" },
    keygroup    = "numrow",
    description = "move focused client to tag",
    group       = "tag",
    on_press    = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  },
  awful.key {
    modifiers   = { mod, "Shift" },
    keygroup    = "numrow",
    description = "move focused client to tag and follow",
    group       = "tag",
    on_press    = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
          tag:view_only()
        end
      end
    end,
  }
})

client.connect_signal("request::default_keybindings", function()
  awful.keyboard.append_client_keybindings({
    -- Client
    awful.key(
      { mod }, "c",
      function(c)
        awful.placement.centered(c, { honor_workarea = true })
      end,
      { description = "center window", group = "client" }
    ),
    awful.key(
      { mod }, "f",
      function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
      { description = "toggle fullscreen", group = "client" }
    ),
    awful.key(
      { mod }, "s",
      function(c)
        c.floating = not c.floating
        c:raise()
      end,
      { description = "toggle floating", group = "client" }
    ),
    awful.key(
      { mod }, "n",
      function()
        client.focus.minimized = true
      end,
      { description = "minimize", group = "client" }
    ),
    awful.key(
      { mod }, "m",
      function(c)
        c.maximized = not c.maximized
        c:raise()
      end,
      { description = "toggle maximize", group = "client" }
    ),
    awful.key(
      { alt }, "F4", function(c)
        c:kill()
      end,
      { description = "close", group = "client" }
    ),
  })
end)
