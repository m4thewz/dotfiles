local colors = require 'highligths'.get
local lsp = require "feline.providers.lsp"

local modes = {
  ["n"] = { "NORMAL", colors.red },
  ["no"] = { "N-PENDING", colors.red },
  ["i"] = { "INSERT", colors.dark_purple },
  ["ic"] = { "INSERT", colors.dark_purple },
  ["t"] = { "TERMINAL", colors.green },
  ["v"] = { "VISUAL", colors.cyan },
  ["V"] = { "V-LINE", colors.cyan },
  [""] = { "V-BLOCK", colors.cyan },
  ["R"] = { "REPLACE", colors.orange },
  ["Rv"] = { "V-REPLACE", colors.orange },
  ["s"] = { "SELECT", colors.nord_blue },
  ["S"] = { "S-LINE", colors.nord_blue },
  [""] = { "S-BLOCK", colors.nord_blue },
  ["c"] = { "COMMAND", colors.pink },
  ["cv"] = { "COMMAND", colors.pink },
  ["ce"] = { "COMMAND", colors.pink },
  ["r"] = { "PROMPT", colors.teal },
  ["rm"] = { "MORE", colors.teal },
  ["r?"] = { "CONFIRM", colors.teal },
  ["!"] = { "SHELL", colors.green },
}

local style = {
  left = "",
  right = " ",
}

local components = {
  active = {},
  inactive = {}
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

components.active[1][1] = {
  provider = "  ",

  hl = { fg = colors.white, bg = colors.nord_blue },

  right_sep = {
    str = style.right,
    hl = {
      fg = colors.nord_blue,
      bg = colors.lightbg,
    }
  },
}

components.active[1][2] = {
  provider = function()
    local filename = vim.fn.expand "%:t"
    local extension = vim.fn.expand "%:e"
    local icon = require("nvim-web-devicons").get_icon(filename, extension)
    if icon == nil then
      icon = "  "
      return icon
    end
    return " " .. icon .. " " .. filename .. " "
  end,

  hl = { fg = colors.white, bg = colors.lightbg },

  right_sep = { str = style.right, hl = { fg = colors.lightbg, bg = colors.lightbg2 } },
}

components.active[1][3] = {
  provider = function()
    local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    return "  " .. dir_name .. " "
  end,

  hl = { fg = colors.grey_fg2, bg = colors.lightbg2 },
  right_sep = {
    str = style.right,
    hl = { fg = colors.lightbg2, bg = colors.statusline_bg },
  },
}

components.active[1][4] = {
  provider = "git_diff_added",
  hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
  icon = " ",
}

components.active[1][5] = {
  provider = "git_diff_changed",
  hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
  icon = "   ",
}

components.active[1][6] = {
  provider = "git_diff_removed",
  hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
  icon = "  ",
}

components.active[1][7] = {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist "Error"
  end,

  hl = { fg = colors.red },
  icon = "  ",
}

components.active[1][8] = {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist "Warning"
  end,
  hl = { fg = colors.yellow },
  icon = "  ",
}

components.active[1][9] = {
  provider = "diagnostic_hints",
  enabled = function()
    return lsp.diagnostics_exist "Hint"
  end,
  hl = { fg = colors.grey_fg2 },
  icon = "  ",
}

components.active[1][10] = {
  provider = "diagnostic_info",
  enabled = function()
    return lsp.diagnostics_exist "Information"
  end,
  hl = { fg = colors.green },
  icon = "  ",
}
components.active[3][1] = {
  provider = function()
    if next(vim.lsp.buf_get_clients()) ~= nil then
      return "  LSP"
    else
      return ""
    end
  end,
  hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
}

components.active[3][2] = {
  provider = "git_branch",
  hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
  icon = "  ",
}

components.active[3][3] = {
  provider = " ",
  hl = function()
    return {
      fg = modes[vim.fn.mode()][2],
      bg = colors.statusline_bg,
    }
  end,
}

components.active[3][4] = {
  provider = " ",
  hl = function()
    return {
       fg = colors.statusline_bg,
       bg = modes[vim.fn.mode()][2],
    }
  end,
}

components.active[3][5] = {
  provider = function()
    return " " .. modes[vim.fn.mode()][1] .. " "
  end,
  hl = function()
    return {
      fg = modes[vim.fn.mode()][2],
      bg = colors.one_bg,
    }
  end,
}

components.active[3][6] = {
  provider = style.left,
  hl = { fg = colors.green, bg = colors.one_bg },
}

components.active[3][7] = {
  provider = " ",
  hl = { fg = colors.black, bg = colors.green },
}

components.active[3][8] = {
  provider = " ",
  enabled = function()
    return vim.fn.line "." >= 100
  end
}

components.active[3][9] = {
  provider = "position",
  hl = { fg = colors.green, bg = colors.lightbg2 },
}

require("feline").setup {
  colors = {
    bg = colors.statusline_bg,
    fg = colors.fg,
  },
  components = components,
}
