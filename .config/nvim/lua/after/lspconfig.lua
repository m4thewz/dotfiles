local sumneko_path = os.getenv "HOME" .. "/.config/lua-language-server/"

local lsp = vim.lsp
local lspconfig = require("lspconfig")

lsp.set_log_level("debug")

local capabilities = lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-cmp.

local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").update_capabilities(lsp.protocol.make_client_capabilities()),
  }, _config or {})
end

local lspServers = { 'tsserver', 'eslint', 'html', 'cssls' }
lspconfig.sumneko_lua.setup(config({
  cmd = { sumneko_path .. "./bin/Linux/lua-language-server", "-E", sumneko_path .. "main.lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
}))

for _, server in ipairs(lspServers) do lspconfig[server].setup(config()) end

require("luasnip.loaders.from_vscode").lazy_load({
  paths = { vim.env.HOME .. "/.vim/plugged/friendly-snippets" },
  include = nil,
  exclude = {},
})
