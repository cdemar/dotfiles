-- Install Lazy.nvim (the plugin manager) on first launch.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Every file in lua/cdemar/plugins/ is loaded automatically.
require("lazy").setup({ { import = "cdemar.plugins" } }, {
  change_detection = { notify = false },
})
