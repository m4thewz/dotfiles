local M = {}

local function highlight(group, guifg, guibg, attr, guisp)
  local parts = { group }

  if guifg then table.insert(parts, "guifg=#" .. guifg) end
  if guibg then table.insert(parts, "guibg=#" .. guibg) end
  if attr then table.insert(parts, "gui=" .. attr) end
  if guisp then table.insert(parts, "guisp=#" .. guisp) end

  vim.api.nvim_command("highlight " .. table.concat(parts, " "))
end

M.get = {
  white = "#F8F8F2",
  darker_black = "#232531",
  black = "#282A36",
  black2 = "#303341",
  grey = "#41434f",
  grey_fg = "#5a5c68",
  red = "#E95678",
  pink = "#FF79C6",
  green = "#69ff94",
  yellow = "#F1FA8C",
  purple = "#BD93F9",
  cyan = "#8BE9FD",
}

M.apply = function ()

  vim.cmd "hi clear CursorLine"

  highlight("Normal", 'e9e9f4', '282a36', nil, nil)
  highlight("Bold", nil, nil, "bold", nil)
  highlight("Debug", 'ffb86c', nil, nil, nil)
  highlight("Directory", '69ff94', nil, nil, nil)
  highlight("Error", '282a36', 'ffb86c', nil, nil)
  highlight("ErrorMsg", 'ffb86c', '282a36', nil, nil)
  highlight("Exception", 'ffb86c', nil, nil, nil)
  highlight("FoldColumn", '8be9fd', '3a3c4e', nil, nil)
  highlight("Folded", '6272a4', '3a3c4e', nil, nil)
  highlight("IncSearch", '3a3c4e', 'bd93f9', "none", nil)
  highlight("Italic", nil, nil, "none", nil)
  highlight("Macro", 'ffb86c', nil, nil, nil)
  highlight("MatchParen", nil, '6272a4', nil, nil)
  highlight("ModeMsg", 'ffffa5', nil, nil, nil)
  highlight("MoreMsg", 'ffffa5', nil, nil, nil)
  highlight("Question", '69ff94', nil, nil, nil)
  highlight("Search", '3a3c4e', '8be9fd', nil, nil)
  highlight("Substitute", '3a3c4e', '8be9fd', "none", nil)
  highlight("SpecialKey", '6272a4', nil, nil, nil)
  highlight("TooLong", 'ffb86c', nil, nil, nil)
  highlight("Underlined", 'ffb86c', nil, nil, nil)
  highlight("Visual", nil, '44475a', nil, nil)
  highlight("VisualNOS", 'ffb86c', nil, nil, nil)
  highlight("WarningMsg", 'ffb86c', nil, nil, nil)
  highlight("WildMenu", 'ffb86c', '8be9fd', nil, nil)
  highlight("Title", '69ff94', nil, "none", nil)
  highlight("Conceal", '69ff94', '282a36', nil, nil)
  highlight("NonText", '6272a4', nil, nil, nil)
  highlight("QuickFixLine", nil, '3a3c4e', "none", nil)

  highlight("StatusLine", '62d6e8', "NONE", "none", nil)
  highlight("StatusLineNC", '6272a4', "NONE", "none", nil)

  highlight("SignColumn", '6272a4', "NONE", nil, nil)
  highlight("VertSplit", '44475a', "NONE", "none", nil)

  highlight("ColorColumn", nil, '3a3c4e', "none", nil)
  highlight("LineNr", '41434f', "none", nil, nil)
  highlight("CursorColumn", nil, 'none', "none", nil)
  highlight("CursorLineNr", 'f8f8f2', "none", nil, nil)
  highlight("Cursor", '282a36', 'e9e9f4', nil, nil)

  highlight("FloatBorder", 'bd93f9', nil, nil, nil)
  highlight("NormalFloat", 'f8f8f2', nil, nil, nil)

  highlight("Pmenu", 'e9e9f4', '373844', 'none', nil)
  highlight("PmenuSbar", nil, '44475a', nil, nil)
  highlight("PmenuSel", '3a3c4e', 'b389ef', nil, nil)
  highlight("PmenuThumb", nil, 'bd93f9', nil, nil)

  highlight("CmpItemAbbr", 'f8f8f2', nil, nil, nil)
  highlight("CmpItemAbbrMatch", 'f8f8f2', nil, nil, nil)
  highlight("CmpItemMenu", 'f8f8f2', nil, nil, nil)

  highlight("CmpItemAbbrMatchFuzzy", '8BE9FD', nil, nil, nil)
  highlight("CmpItemKindText", 'f8f8f2', nil, nil, nil)
  highlight("CmpItemKindMethod", 'BD93F9', nil, nil, nil)
  highlight("CmpItemKindFunction", 'BD93F9', nil, nil, nil)
  highlight("CmpItemKindConstructor", '69ff94', nil, nil, nil)
  highlight("CmpItemKindField", '8BE9FD', nil, nil, nil)
  highlight("CmpItemKindVariable", '9CDCFE', nil, nil, nil)
  highlight("CmpItemKindClass", '69ff94', nil, nil, nil)
  highlight("CmpItemKindInterface", '69ff94', nil, nil, nil)
  highlight("CmpItemKindValue", 'ffb86c', nil, nil, nil)
  highlight("CmpItemKindSnippet", 'e95678', nil, nil, nil)
  highlight("CmpItemKindSnippet", 'C586C0', nil, nil, nil)
  highlight("CmpItemKindFile", 'ffb86c', nil, nil, nil)
  highlight("CmpItemKindFolder", 'ffb86c', nil, nil, nil)

  highlight("IndentBlanklineChar", '373844', nil, nil, nil)

  highlight("NvimTreeNormal", 'f8f8f2', '232531', nil, nil)
  highlight("NvimTreeVertSplit", '232531', '232531', nil, nil)
  highlight("NvimTreeGitDirty", 'f1fa8c', nil, nil, nil)
  highlight("NvimTreeGitNew", '69ff94', nil, nil, nil)
  highlight("NvimTreeImageFile", 'ff79c6', nil, nil, nil)
  highlight("NvimTreeFolderIcon", 'bd93f9', nil, nil, nil)
  highlight("NvimTreeEmptyFolderName", '6272A4', nil, nil, nil)
  highlight("NvimTreeFolderName", 'bd93f9', nil, nil, nil)
  highlight("NvimTreeOpenedFolderName", '69ff94', nil, nil, nil)
  highlight("NvimTreeCursorLine", nil, 'none', nil, nil)
  highlight("NvimTreeIn", nil, '44475a', nil, nil)
  highlight("NvimTreeSpecialFile", 'FFB86C', nil, 'underline', nil)
  highlight("NvimTreeIndentMarker", '44475a', nil, nil, nil)
  highlight("NvimTreeRootFolder", '69ff94', nil, 'bold', nil)
  highlight("NvimTreeWindowPicker", 'bd93f9', '303341', nil, nil)
  highlight("NvimTreeNormalNC", nil, '232531', nil, nil)
  highlight("NvimTreeStatuslineNc", '232531', '232531', nil, nil)
  highlight("NvimTreeStatusline", '232531', '232531', nil, nil)

  highlight("EndOfBuffer", '282a36', nil, nil, nil)
  highlight("NvimTreeEndOfBuffer", '232531', nil, nil, nil)

  highlight("LspDiagnosticsSignError", 'e95678', nil, nil, nil)
  highlight("LspDiagnosticsSignWarning", 'f1fA8c', nil, nil, nil)
  highlight("LspDiagnosticsSignInformation", '69ff94', nil, nil, nil)
  highlight("LspDiagnosticsSignHint", 'bd93f9', nil, nil, nil)
  highlight("LspDiagnosticsVirtualTextError", 'e95678', nil, nil, nil)
  highlight("LspDiagnosticsVirtualTextWarning", 'f1fA8c', nil, nil, nil)
  highlight("LspDiagnosticsVirtualTextInformation", '69ff94', nil, nil, nil)
  highlight("LspDiagnosticsVirtualTextHint", 'bd93f9', nil, nil, nil)

  highlight("TabLine", '6272a4', '3a3c4e', "none", nil)
  highlight("TabLineFill", '6272a4', '3a3c4e', "none", nil)
  highlight("TabLineSel", 'ffffa5', '3a3c4e', "none", nil)

  -- Standard syntax highlighting

  highlight("Boolean", 'bd93f9', nil, nil, nil)
  highlight("Character", 'ffb86c', nil, nil, nil)
  highlight("Comment", '6272a4', nil, nil, nil)
  highlight("Conditional", 'ff92df', nil, nil, nil)
  highlight("Constant", 'bd93f9', nil, nil, nil)
  highlight("Define", 'ff92df', nil, "none", nil)
  highlight("Delimiter", 'f7f7fb', nil, nil, nil)
  highlight("Float", 'bd93f9', nil, nil, nil)
  highlight("Function", '69ff94', nil, nil, nil)
  highlight("Identifier", 'ffb86c', nil, "none", nil)
  highlight("Include", '69ff94', nil, nil, nil)
  highlight("Keyword", 'ff92df', nil, nil, nil)
  highlight("Label", '8be9fd', nil, nil, nil)
  highlight("Number", 'bd93f9', nil, nil, nil)
  highlight("Operator", 'e9e9f4', nil, "none", nil)
  highlight("PreProc", '8be9fd', nil, nil, nil)
  highlight("Repeat", '8be9fd', nil, nil, nil)
  highlight("Special", '8be9fd', nil, nil, nil)
  highlight("SpecialChar", 'f7f7fb', nil, nil, nil)
  highlight("Statement", 'ffb86c', nil, nil, nil)
  highlight("StorageClass", '8be9fd', nil, nil, nil)
  highlight("String", 'ffffa5', nil, nil, nil)
  highlight("Structure", 'ff92df', nil, nil, nil)
  highlight("Tag", '8be9fd', nil, nil, nil)
  highlight("Todo", '8be9fd', '3a3c4e', nil, nil)
  highlight("Type", '8be9fd', nil, "none", nil)
  highlight("Typedef", '8be9fd', nil, nil, nil)

  ---
  -- Language definitions
  ---

  -- C highlighting

  highlight("cOperator", '8be9fd', nil, nil, nil)
  highlight("cPreCondit", 'ff92df', nil, nil, nil)

  -- C# highlighting

  highlight("csClass", '8be9fd', nil, nil, nil)
  highlight("csAttribute", '8be9fd', nil, nil, nil)
  highlight("csModifier", 'ff92df', nil, nil, nil)
  highlight("csType", 'ffb86c', nil, nil, nil)
  highlight("csUnspecifiedStatement", '69ff94', nil, nil, nil)
  highlight("csContextualStatement", 'ff92df', nil, nil, nil)
  highlight("csNewDecleration", 'ffb86c', nil, nil, nil)

  -- CSS highlighting

  highlight("cssBraces", 'e9e9f4', nil, nil, nil)
  highlight("cssClassName", 'ff92df', nil, nil, nil)
  highlight("cssColor", '8be9fd', nil, nil, nil)

  -- Diff highlighting

  highlight("DiffAdd", 'bd93f9', 'none', nil, nil)
  highlight("DiffChange", '5a5c68', 'none', nil, nil)
  highlight("DiffDelete", 'E95678', 'none', nil, nil)
  highlight("DiffText", '69ff94', '3a3c4e', nil, nil)

  -- Git highlighting

  highlight("gitcommitOverflow", 'ffb86c', nil, nil, nil)
  highlight("gitcommitSummary", 'ffffa5', nil, nil, nil)
  highlight("gitcommitComment", '6272a4', nil, nil, nil)
  highlight("gitcommitUntracked", '6272a4', nil, nil, nil)
  highlight("gitcommitDiscarded", '6272a4', nil, nil, nil)
  highlight("gitcommitSelected", '6272a4', nil, nil, nil)
  highlight("gitcommitHeader", 'ff92df', nil, nil, nil)
  highlight("gitcommitSelectedType", '69ff94', nil, nil, nil)
  highlight("gitcommitUnmergedType", '69ff94', nil, nil, nil)
  highlight("gitcommitDiscardedType", '69ff94', nil, nil, nil)
  highlight("gitcommitBranch", 'bd93f9', nil, "bold", nil)
  highlight("gitcommitUntrackedFile", '8be9fd', nil, nil, nil)
  highlight("gitcommitUnmergedFile", 'ffb86c', nil, "bold", nil)
  highlight("gitcommitDiscardedFile", 'ffb86c', nil, "bold", nil)
  highlight("gitcommitSelectedFile", 'ffffa5', nil, "bold", nil)

  -- HTML highlighting

  highlight("htmlBold", '8be9fd', nil, nil, nil)
  highlight("htmlItalic", 'ff92df', nil, nil, nil)
  highlight("htmlEndTag", 'e9e9f4', nil, nil, nil)
  highlight("htmlTag", 'e9e9f4', nil, nil, nil)

  -- JavaScript highlighting

  highlight("javaScript", 'e9e9f4', nil, nil, nil)
  highlight("javaScriptBraces", 'e9e9f4', nil, nil, nil)
  highlight("javaScriptNumber", 'bd93f9', nil, nil, nil)
  highlight("jsOperator", '69ff94', nil, nil, nil)
  highlight("jsStatement", 'ff92df', nil, nil, nil)
  highlight("jsReturn", 'ff92df', nil, nil, nil)
  highlight("jsThis", 'ffb86c', nil, nil, nil)
  highlight("jsClassDefinition", '8be9fd', nil, nil, nil)
  highlight("jsFunction", 'ff92df', nil, nil, nil)
  highlight("jsFuncName", '69ff94', nil, nil, nil)
  highlight("jsFuncCall", '69ff94', nil, nil, nil)
  highlight("jsClassFuncName", '69ff94', nil, nil, nil)
  highlight("jsClassMethodType", 'ff92df', nil, nil, nil)
  highlight("jsRegexpString", '8be9fd', nil, nil, nil)
  highlight("jsGlobalObjects", '8be9fd', nil, nil, nil)
  highlight("jsGlobalNodeObjects", '8be9fd', nil, nil, nil)
  highlight("jsExceptions", '8be9fd', nil, nil, nil)
  highlight("jsBuiltins", '8be9fd', nil, nil, nil)

  -- Mail highlighting

  highlight("mailQuoted1", '8be9fd', nil, nil, nil)
  highlight("mailQuoted2", 'ffffa5', nil, nil, nil)
  highlight("mailQuoted3", 'ff92df', nil, nil, nil)
  highlight("mailQuoted4", '8be9fd', nil, nil, nil)
  highlight("mailQuoted5", '69ff94', nil, nil, nil)
  highlight("mailQuoted6", '8be9fd', nil, nil, nil)
  highlight("mailURL", '69ff94', nil, nil, nil)
  highlight("mailEmail", '69ff94', nil, nil, nil)

  -- Markdown highlighting

  highlight("markdownCode", 'ffffa5', nil, nil, nil)
  highlight("markdownError", 'e9e9f4', '282a36', nil, nil)
  highlight("markdownCodeBlock", 'ffffa5', nil, nil, nil)
  highlight("markdownHeadingDelimiter", '69ff94', nil, nil, nil)

  -- PHP highlighting

  highlight("phpMemberSelector", 'e9e9f4', nil, nil, nil)
  highlight("phpComparison", 'e9e9f4', nil, nil, nil)
  highlight("phpParent", 'e9e9f4', nil, nil, nil)
  highlight("phpMethodsVar", '8be9fd', nil, nil, nil)

  -- Python highlighting

  highlight("pythonOperator", 'ff92df', nil, nil, nil)
  highlight("pythonRepeat", 'ff92df', nil, nil, nil)
  highlight("pythonInclude", 'ff92df', nil, nil, nil)
  highlight("pythonStatement", 'ff92df', nil, nil, nil)

  -- Ruby highlighting

  highlight("rubyAttribute", '69ff94', nil, nil, nil)
  highlight("rubyConstant", '8be9fd', nil, nil, nil)
  highlight("rubyInterpolationDelimiter", 'f7f7fb', nil, nil, nil)
  highlight("rubyRegexp", '8be9fd', nil, nil, nil)
  highlight("rubySymbol", 'ffffa5', nil, nil, nil)
  highlight("rubyStringDelimiter", 'ffffa5', nil, nil, nil)

  -- SASS highlighting

  highlight("sassidChar", 'ffb86c', nil, nil, nil)
  highlight("sassClassChar", 'bd93f9', nil, nil, nil)
  highlight("sassInclude", 'ff92df', nil, nil, nil)
  highlight("sassMixing", 'ff92df', nil, nil, nil)
  highlight("sassMixinName", '69ff94', nil, nil, nil)

  -- Java highlighting

  highlight("javaOperator", '69ff94', nil, nil, nil)

  -- LspDiagnostic base highlight group

  highlight("LspDiagnosticsDefaultError", 'ffb86c', nil, nil, nil)
  highlight("LspDiagnosticsDefaultWarning", '8be9fd', nil, nil, nil)
  highlight("LspDiagnosticsDefaultInformation", '69ff94', nil, nil, nil)
  highlight("LspDiagnosticsDefaultHint", '8be9fd', nil, nil, nil)

end

return M
