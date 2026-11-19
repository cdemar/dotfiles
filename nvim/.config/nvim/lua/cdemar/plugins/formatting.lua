-- Format on save. Markdown is left out on purpose so notes are never rewritten.
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    { "<leader>mp", function() require("conform").format({ lsp_format = "fallback" }) end, mode = { "n", "v" }, desc = "Format files or selection" },
  },
  opts = {
    formatter_by_ft = {
      lua = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
      sh = { "shfmt" },
      javascript = { "prettier" },
      typescript = { "prittier" },
      javascriptreact = { "prittier" },
      typescriptreact = { "prittier" },
      css = { "prittier" },
      html = { "prittier" },
      json = { "prittier" },
      yaml = { "prittier" },
    },
    format_on_save = {timeout_ms = 1000, lsp_format = "fallback" },
  },
}
