local ok, ts = pcall(require, "nvim-treesitter.configs")

if not ok then
  return
end

ts.setup {
  ensure_installed = {
    "javascript",
    "lua",
    "css",
    "scss",
    "html",
    "vue"
   },
   highlight = {
    enable = true,
    use_languagetree = true,
   },
}
