local M = {}

M.close_buf = function()
  local function switch_buffer(windows, buf)
     local cur_win = vim.fn.winnr()

     for _, winid in ipairs(windows) do
        vim.cmd(string.format("%d wincmd w", vim.fn.win_id2win(winid)))
        vim.cmd(string.format("buffer %d", buf))
     end

     vim.cmd(string.format("%d wincmd w", cur_win))
  end

  local function get_next_buf(buf)
     local next = vim.fn.bufnr "#"

     for i = 0, vim.fn.bufnr "$" - 1 do
        next = (buf + i) % vim.fn.bufnr "$" + 1
        if vim.fn.buflisted(next) == 1 then
           return next
        end
     end
  end

  local buf = vim.fn.bufnr()
  if vim.fn.buflisted(buf) == 0 then
     vim.cmd "close"
     return
  end

  if #vim.fn.getbufinfo { buflisted = 1 } < 2 then
     vim.cmd "enew"
     vim.cmd "bp"
  end

  local next_buf = get_next_buf(buf)
  local windows = vim.fn.getbufinfo(buf)[1].windows

   switch_buffer(windows, next_buf)
   vim.cmd(string.format("silent! confirm bd %d", buf))

   if vim.fn.buflisted(buf) == 1 then
     switch_buffer(windows, buf)
  end
end

M.lazy_load = function(plugin)
   if plugin then
      vim.defer_fn(function()
         require("packer").loader(plugin)
      end, 0)
   end
end

return M
