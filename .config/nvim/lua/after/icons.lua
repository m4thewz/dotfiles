local colors = require 'highlights'.get

require("nvim-web-devicons").setup {
   override = {
     css = {
         icon = "",
         color = '#2965f1',
         name = "css",
      },
     html = {
         icon = "",
         color = "#DE8C92",
         name = "html",
      },
     js = {
         icon = "",
         color = "#FFFFA5",
         name = "js",
      },
      lock = {
         icon = "",
         color = colors.red,
         name = "lock",
      },
      lua = {
         icon = "",
         color = colors.purple,
         name = "lua",
      },
      ts = {
         icon = "ﯤ",
         color = "#0088cc",
         name = "ts",
      },
      vue = {
         icon = "﵂",
         color = colors.green,
         name = "vue",
      },
   },
}
