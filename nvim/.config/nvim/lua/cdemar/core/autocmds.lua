local group = vim.api.nvim_create_augroup("cdemar", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Pick up files that Claude Code (or git) changed on disk.
autocmd({ "FocusGained", "BufEnter" }, {
  group = group,
  command = "silent! checktime",
})

-- Flash the text you just yanked.
autocmd("TextYankPost", {
  group = group,
  callback = function()
    vim.hl.on_yank()
  end,
})

-- No file tree, so let `:e some/new/dir/file.lua` + `:w` create the folders.
autocmd("BufWritePre", {
  group = group,
  callback = function(event)
    if event.match:match("^%w+://") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
