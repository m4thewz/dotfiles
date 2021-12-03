local lsp = vim.lsp

lsp.set_log_level("debug")

require('after.lsp.servers')
require('after.lsp.saga')
require('after.lsp.diagnostics')

lsp.protocol.make_client_capabilities().textDocument.completion.completionItem.snippetSupport = true

