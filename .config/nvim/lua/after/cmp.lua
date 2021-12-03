local cmp = require("cmp")
local lspkind = require("lspkind")
local kinds = vim.lsp.protocol.CompletionItemKind

local icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

lspkind.init({ with_text = true })

for i, kind in ipairs(kinds) do
  kinds[i] = icons[kind] or kind
end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(entry, vim_item)
      -- vim_item.kind = lspkind.presets.default[vim_item.kind]
      vim_item.kind = string.format(' %s %s', icons[vim_item.kind], vim_item.kind)

      vim_item.menu = ({
        buffer = "",
        nvim_lsp = "",
        luasnip = "",
        nvim_lua = "",
        latex_symbols = "",
      })[entry.source.name]
      return vim_item
    end
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
  },
})
