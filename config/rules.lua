local awful = require "awful"

awful.rules.rules = {
  {
    rule = {},
    properties = {
      focus     = awful.client.focus.filter,
      raise     = true,
      screen    = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      callback  = function(c)
        local margin = 27

        if c.floating and c.maximized then
          c:geometry({
            height = c:geometry().height - margin
          })
        end
      end

    }
  },
  {
    id = "titlebar",
    rule_any = {
      type = { "normal", "dialog", "modal", "utility" }
    },
    properties = { titlebars_enabled = true }
  }
}

client.connect_signal("manage", function(c)
  if c.floating then
    c:raise()
  end
end)
