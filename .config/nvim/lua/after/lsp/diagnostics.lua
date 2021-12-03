vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 2, prefix = "●" },
  severity_sort = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local hlSigns = { "Error", "Warning", "Hint", "Information" }

for type, icon in pairs(signs) do

  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

for _, type in ipairs(hlSigns) do
  vim.cmd("hi LspDiagnosticsUnderline" .. type .. " gui=undercurl" )
end


