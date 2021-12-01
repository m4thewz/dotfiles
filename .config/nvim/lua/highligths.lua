local M = {}
local cmd = vim.cmd

local fg_bg = function(group, fg, bg) cmd("hi " .. group .. " guifg=" .. fg .. " guibg=" .. bg) end
local fg = function(group, fg) cmd("hi " .. group .. " guifg=" .. fg) end
local bg = function(group, bg) cmd("hi " .. group .. " guibg=" .. bg) end

M.get = {
  white = "#F8F8F2",
  darker_black = "#232531",
  black = "#282A36",
  black2 = "#303341",
  one_bg = "#373844",
  one_bg2 = "#44475a",
  one_bg3 = "#565761",
  grey = "#41434f",
  grey_fg = "#5a5c68",
  grey_fg2 = "#5a5c68",
  light_grey = "#636571",
  red = "#E95678",
  pink = "#FF79C6",
  line = "#373844",
  green = "#69ff94",
  nord_blue = "#b389ef",
  blue = "#BD93F9",
  yellow = "#F1FA8C",
  sun = "#FFFFA5",
  purple = "#BD93F9",
  dark_purple = "#BD93F9",
  teal = "#0088cc",
  orange = "#FFB86C",
  cyan = "#8BE9FD",
  statusline_bg = "#2b2d39",
  lightbg = "#343642",
  lightbg2 = "#2f313d",
  pmenu_bg = "#b389ef",
  folder_bg = "#BD93F9",
}

M.apply = function()
  local colors = M.get

  -- Selected Line
  cmd "hi clear CursorLine"
  fg ("cursorlinenr", colors.white)
  fg ("LineNr", colors.grey)

  -- Blankline
  fg("IndentBlanklineChar", colors.line)

  -- NvimTree
  fg_bg("NvimTreeNormal ", colors.white, colors.darker_black)
  fg_bg("NvimTreeVertSplit", colors.darker_black, colors.darker_black)
  fg("NvimTreeGitDirty", colors.yellow)
  fg("NvimTreeGitNew", colors.green)
  fg("NvimTreeImageFile", colors.pink)
  fg("NvimTreeFolderIcon", colors.purple)
	fg("NvimTreeEmptyFolderName", "#6272A4")
	fg("NvimTreeFolderName", colors.purple)
	fg("NvimTreeOpenedFolderName", colors.green)
	bg("NvimTreeCursorLine", "none")
	bg("NvimTreeIn", "#44475A")
	fg("NvimTreeSpecialFile", colors.pink .. " gui=underline")
  fg("NvimTreeIndentMarker", colors.one_bg2)
  fg("NvimTreeRootFolder", colors.green .. " gui=bold")
  fg_bg("NvimTreeWindowPicker", colors.purple, colors.black2)

  bg("NvimTreeNormalNC", colors.darker_black)
  fg_bg("NvimTreeStatuslineNc", colors.darker_black, colors.darker_black)
  fg_bg("NvimTreeStatusline", colors.darker_black, colors.darker_black)

  -- GitSigns
  fg_bg("DiffAdd", colors.nord_blue, "none")
  fg_bg("DiffChange", colors.grey_fg, "none")
  fg_bg("DiffModified", colors.nord_blue, "none")

  -- Remove ~
  fg("EndOfBuffer", colors.black)
  fg("NvimTreeEndOfBuffer", colors.darker_black)
end

return M
