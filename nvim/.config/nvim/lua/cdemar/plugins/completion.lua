-- The completion popup. Searches: language server, file paths, snippits, buffer words.
return {
  "saghen/blink.cmp",
  version = "1.*", -- stable line; downloads a prebuilt fuzzy matcher
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    -- <C-n>/<C-p> move, <C-y> accept, <C-space> open, <C-e> close
    keymap = { preset = "default" },
    completion = { documentation = { auto_show = true } },
    signature = { enabled = true }, -- show function arguments as you type them
  },
}
