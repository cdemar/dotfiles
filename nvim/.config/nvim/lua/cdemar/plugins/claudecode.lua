-- Connects Neovim to Claude Code running in the WezTerm pane next door.
-- Start Claude with `claude --ide` (or type /ide inside it) to link the two.
return {
  "coder/claudecode.nvim",
  lazy = false,                       -- the connection server must be up before Claude looks for it
  opts = {
    terminal = { provider = "none" }, -- Claude lives in WezTerm, not inside Neovim
  },
  keys = {
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",       mode = "v",                      desc = "Send selection to Claude" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",      desc = "Add this file to Claude" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude's change" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Reject Claude's change" },
  },
}
