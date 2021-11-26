local present, bufferline = pcall(require, "bufferline")
if not present then
   return
end

local colors = require('hl_themes.chadracula')

vim.cmd 'hi NvimTreeBufferLabel gui=bold guifg=#F8F8F2 guibg=#232531'

bufferline.setup {
  options = {
    offsets = { 
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "NvimTreeBufferLabel",
        padding = 1,
      } 
    },
    buffer_close_icon = "",
    modified_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    close_icon = "",
    show_close_icon = true,
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "thin",
    always_show_bufferline = true,
    diagnostics = false,
    custom_filter = function(buf_number)
      local present_type, type = pcall(function()
        return vim.api.nvim_buf_get_var(buf_number, "term_type")
      end)

      if present_type then
        if type == "vert" then
          return false
        elseif type == "hori" then
          return false
        else
          return true
        end
      else
        return true
      end
    end,
  },

  highlights = {
    background = {
       guifg = colors.grey_fg,
       guibg = colors.black2,
    },

    buffer_selected = {
       guifg = colors.white,
       guibg = colors.black,
       gui = "bold",
    },
    buffer_visible = {
       guifg = colors.light_grey,
       guibg = colors.black2,
    },

    duplicate = {
      guifg = colors.grey,
      guibg = colors.black2,
      gui = "underline"
    },

    error = {
       guifg = colors.light_grey,
       guibg = colors.black2,
    },
    error_diagnostic = {
       guifg = colors.light_grey,
       guibg = colors.black2,
    },

    close_button = {
       guifg = colors.light_grey,
       guibg = colors.black2,
    },
    close_button_visible = {
       guifg = colors.light_grey,
       guibg = colors.black2,
    },
    close_button_selected = {
       guifg = colors.red,
       guibg = colors.black,
    },
    fill = {
       guifg = colors.grey_fg,
       guibg = colors.black2,
    },
    indicator_selected = {
       guifg = colors.black,
       guibg = colors.black,
    },

    modified = {
       guifg = colors.red,
       guibg = colors.black2,
    },
    modified_visible = {
       guifg = colors.red,
       guibg = colors.black2,
    },
    modified_selected = {
       guifg = colors.green,
       guibg = colors.black,
    },

    separator = {
       guifg = colors.black2,
       guibg = colors.black2,
    },
    separator_visible = {
       guifg = colors.black2,
       guibg = colors.black2,
    },
    separator_selected = {
       guifg = colors.black2,
       guibg = colors.black2,
    },

    tab = {
       guifg = colors.light_grey,
       guibg = "#595761",
    },
    tab_selected = {
       guifg = colors.black2,
       guibg = "#b389ef",
    },
    tab_close = {
       guifg = colors.red,
       guibg = colors.black,
    },
  },
}
