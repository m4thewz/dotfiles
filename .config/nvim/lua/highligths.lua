local M = {}
local cmd = vim.cmd

local fg = function(group, fg) cmd("hi " .. group .. " guifg=" .. fg) end
local bg = function(group, bg) cmd("hi " .. group .. " guibg=" .. bg) end
local fg_bg = function(group, fg, bg) cmd("hi " .. group .. " guifg=" .. fg .. " guibg=" .. bg) end

local colors = require('hl_themes.chadracula')

M.apply = function()

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
  bg("NvimTreeNormalNC", colors.darker_black)
  fg("NvimTreeGitNew", colors.green)
  fg("NvimTreeImageFile", colors.pink)
  fg("NvimTreeFolderIcon", colors.purple)
	fg("NvimTreeEmptyFolderName", "#6272A4")
	fg("NvimTreeFolderName", colors.purple)
	fg("NvimTreeOpenedFolderName", colors.green)
	bg("NvimTreeCursorLine", "none")
	bg("NvimTreeIn", "#44475A")
	fg("NvimTreeSpecialFile", colors.pink .. " gui=underline")
  fg("NvimTreeEndOfBuffer", colors.darker_black)
  fg("NvimTreeIndentMarker", colors.one_bg2)
  fg("NvimTreeRootFolder", colors.green .. " gui=bold")
  fg_bg("NvimTreeStatuslineNc", colors.darker_black, colors.darker_black)
  fg_bg("NvimTreeWindowPicker", colors.purple, colors.black2)

  -- GitSigns
  fg_bg("DiffAdd", colors.nord_blue, "none")
  fg_bg("DiffChange", colors.grey_fg, "none")
  fg_bg("DiffModified", colors.nord_blue, "none")

  -- Dashboard
  fg("DashboardCenter", colors.grey_fg)
  fg("DashboardFooter", colors.grey_fg)
  fg("DashboardHeader", colors.grey_fg)
  fg("DashboardShortcut", colors.grey_fg)

  -- Remove ~
  fg("EndOfBuffer", colors.black)
end

return M
