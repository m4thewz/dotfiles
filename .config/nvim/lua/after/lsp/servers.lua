local lspconfig = require('lspconfig')
local lspServers = { 'tsserver', 'eslint', 'html', 'cssls', 'vuels' }

local sumneko_path = os.getenv "HOME" .. "/.config/lua-language-server/"

local function config(conf)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }, conf or {})
end

for _, server in ipairs(lspServers) do lspconfig[server].setup(config()) end

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

