local home                                            = os.getenv("HOME")
local helpers                                         = require "helpers"
local dpi                                             = require 'beautiful'.xresources.apply_dpi
local theme                                           = {}
local layout_path                                     = "/usr/share/awesome/themes/default/layouts/"
local titlebar_path                                   = home .. "/.config/awesome/assets/titlebar/"

theme.font_name                                       = "RobotoMono Nerd Font "
theme.font                                            = theme.font_name .. 'Medium 10'
theme.icon_font                                       = 'Symbols Nerd Font Mono Regular '
theme.wallpaper                                       = home .. "/.config/awesome/assets/wallpaper.png"
theme.profile_pic                                     = home .. "/.face"
theme.useless_gap                                     = 1
theme.wibar_height                                    = dpi(40)
theme.border_radius                                   = 12

--Colors
theme.black                                           = '#0a0a0b'
theme.bg_dark                                         = '#11111b'
theme.bg_dim                                          = '#181825'
theme.bg                                              = '#282A36'
theme.bg_light                                        = '#414559'
theme.mid_dark                                        = '#7f849c'
theme.mid_normal                                      = '#a6adc8'
theme.mid_light                                       = '#bac2de'
theme.fg                                              = '#F8F8F2'
theme.fg2                                             = '#d3e0f5'
theme.red                                             = '#FF5555'
theme.orange                                          = '#FFB86C'
theme.yellow                                          = '#F1FA8C'
theme.green                                           = '#50FA7B'
theme.cyan                                            = '#8BE9FD'
theme.lightblue                                       = '#74c7ec'
theme.blue                                            = '#7287fd'
theme.magenta                                         = '#8839ef'
theme.purple                                          = '#BD93F9'
theme.transparent                                     = '#00000000'
theme.border_width                                    = 0
theme.border_normal                                   = theme.black
theme.border_focus                                    = theme.bg_dark

--Layout icons
theme.layout_fairh                                    = layout_path .. "fairhw.png"
theme.layout_fairv                                    = layout_path .. "fairvw.png"
theme.layout_floating                                 = layout_path .. "floatingw.png"
theme.layout_magnifier                                = layout_path .. "magnifierw.png"
theme.layout_max                                      = layout_path .. "maxw.png"
theme.layout_fullscreen                               = layout_path .. "fullscreenw.png"
theme.layout_tilebottom                               = layout_path .. "tilebottomw.png"
theme.layout_tileleft                                 = layout_path .. "tileleftw.png"
theme.layout_tile                                     = layout_path .. "tilew.png"
theme.layout_tiletop                                  = layout_path .. "tiletopw.png"
theme.layout_spiral                                   = layout_path .. "spiralw.png"
theme.layout_dwindle                                  = layout_path .. "dwindlew.png"
theme.layout_cornernw                                 = layout_path .. "cornernw.png"
theme.layout_cornerne                                 = layout_path .. "cornerne.png"
theme.layout_cornersw                                 = layout_path .. "cornersw.png"
theme.layout_cornerse                                 = layout_path .. "cornerse.png"

--Titlebar

theme.titlebar_close_button_normal                    = titlebar_path .. "inactive.svg"
theme.titlebar_close_button_focus                     = titlebar_path .. "close.svg"
theme.titlebar_close_button_normal_hover              = titlebar_path .. "close_hover.svg"
theme.titlebar_close_button_focus_hover               = titlebar_path .. "close_hover.svg"

theme.titlebar_maximized_button_normal_inactive       = titlebar_path .. "inactive.svg"
theme.titlebar_maximized_button_focus_inactive        = titlebar_path .. "maximize.svg"
theme.titlebar_maximized_button_normal_active         = titlebar_path .. "inactive.svg"
theme.titlebar_maximized_button_focus_active          = titlebar_path .. "maximize.svg"
theme.titlebar_maximized_button_normal_inactive_hover = titlebar_path .. "maximize_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = titlebar_path .. "maximize_hover.svg"
theme.titlebar_maximized_button_normal_active_hover   = titlebar_path .. "maximize_hover.svg"
theme.titlebar_maximized_button_focus_active_hover    = titlebar_path .. "maximize_hover.svg"

theme.titlebar_minimize_button_normal                 = titlebar_path .. "inactive.svg"
theme.titlebar_minimize_button_focus                  = titlebar_path .. "minimize.svg"
theme.titlebar_minimize_button_normal_hover           = titlebar_path .. "minimize_hover.svg"
theme.titlebar_minimize_button_focus_hover            = titlebar_path .. "minimize_hover.svg"

--Colors
theme.titlebar_bg                                     = theme.bg_dark
theme.titlebar_bg_focus                               = theme.bg_dark

--Taglist
theme.taglist_spacing                                 = 3

--Tasklist
theme.tasklist_bg_normal                              = theme.mid_dark
theme.tasklist_bg_minimize                            = theme.mid_dark
theme.tasklist_bg_focus                               = theme.blue
theme.tasklist_bg_urgent                              = theme.orange
theme.tasklist_shape                                  = helpers.rrect(3)

--Systray
theme.bg_systray                                      = theme.bg_dark
theme.systray_icon_spacing                            = dpi(5)

-- Naughty
theme.notification_shape                              = helpers.rrect(5)
theme.notification_font                               = theme.font
theme.notification_fg                                 = theme.fg
theme.notification_margin                             = dpi(5)
theme.notification_border_width                       = dpi(0)
theme.notification_spacing                            = dpi(5)
theme.notification_icon_size                          = dpi(130)
theme.notification_icon_resize_strategy               = 'center'
theme.notification_action_underline_normal            = false
theme.notification_action_underline_selected          = false
theme.notification_action_fg_normal                   = theme.fg

return theme
