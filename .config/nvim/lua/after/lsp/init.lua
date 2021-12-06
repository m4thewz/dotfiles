local lsp = vim.lsp

lsp.set_log_level("debug")

require('after.lsp.servers')
require('after.lsp.saga')
require('after.lsp.diagnostics')

local completionItem = lsp.protocol.make_client_capabilities()

completionItem.documentationFormat = { "markdown", "plaintext" }
completionItem.snippetSupport = true
completionItem.preselectSupport = true
completionItem.insertReplaceSupport = true
completionItem.labelDetailsSupport = true
completionItem.deprecatedSupport = true
completionItem.commitCharactersSupport = true
completionItem.tagSupport = { valueSet = { 1 } }
completionItem.resolveSupport = {
   properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
   },
}
