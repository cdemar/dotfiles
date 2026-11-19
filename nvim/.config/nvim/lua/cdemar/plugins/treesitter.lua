-- Tree-sitter parses code so hightlighting and indenting understand structure.
-- Needs the `tree-sitter` CLI (brew "tree-sitter-cli") to build parsers.
local profile = require("cdemar.profile")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(profile.parsers)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(event)
          -- start() fails harmlessly for filetypes with no parser installed
          if pcall(vim.treesitter.start, event.buf) then
            vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    -- auto-close and auto-rename HTML/JSX tags
    "windwp/nvim-ts-autotag",
    enabled = profile.web,
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
