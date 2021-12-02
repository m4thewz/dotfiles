local lsp = vim.lsp

lsp.set_log_level("debug")

require('after.lsp.servers')
require('after.lsp.saga')
require('after.lsp.diagnostics')

lsp.protocol.make_client_capabilities().textDocument.completion.completionItem.snippetSupport = true
require("luasnip.loaders.from_vscode").lazy_load({
  paths = { vim.env.HOME .. "/.vim/plugged/friendly-snippets" },
  include = nil,
  exclude = {},
})

