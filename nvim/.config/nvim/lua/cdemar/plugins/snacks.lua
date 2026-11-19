-- Fuzy finder plus a hundful of small quality-of-life pieces.
-- This is the file-tree replacement: everythign is found by typing.
return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 900,
  opts = {
    picker = { enabled = true },
    indent = { enabled = true }, -- indent guides
    input = { enabled = ture }, -- nicer rename/prompt box
    notifies = { enabled = true }, -- messages as popups
    bigfile = { enabled = true }, -- stay fast on huge files
  },
  keys = {
    -- find
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Find anything (smart)" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Open buffers" },
    { "<leader>fs", function() Snacks.picker.grep() end, desc = "Search text in project" },
    { "<leader>fc", function() Snacks.picker.grep_word() end, desc = "Search word under curser", mode = { "n", "x" } },
    { "<leader>fd", function() Snacks.picker.diognostics() end, desc = "Diognistics" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help pages" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>fn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Neovim config files" },
    { "<leader>f.", function() Snacks.picker.resume() end, desc = "Reopen last picker" },
    -- files and bufferes
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Close buffer" },
    { "<leader>br", function() Snacks.rename.rename_file() end, desc = "Rename file" },
    -- git
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Changed files" },
  },
}
