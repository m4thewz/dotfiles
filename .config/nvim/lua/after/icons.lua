local colors = require 'highligths'.get

require("nvim-web-devicons").setup {
   override = {
     css = {
         icon = "",
         color = colors.blue,
         name = "css",
      },
     html = {
         icon = "",
         color = colors.baby_pink,
         name = "html",
      },
     js = {
         icon = "",
         color = colors.sun,
         name = "js",
      },
      lock = {
         icon = "",
         color = colors.red,
         name = "lock",
      },
      lua = {
         icon = "",
         color = colors.blue,
         name = "lua",
      },
      ts = {
         icon = "ﯤ",
         color = colors.teal,
         name = "ts",
      },
      vue = {
         icon = "﵂",
         color = colors.vibrant_green,
         name = "vue",
      },
   },
}
