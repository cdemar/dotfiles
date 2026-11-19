-- Small editing helpers, all from one repo (mini.nvim). Each line is one module.
return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    lazy = false,
    config = function()
      require("mini.icons").setup() -- file icons in the picker and statusline
      require("mini.statusline").setup() -- mode, git branch, diagnostics, position
      require("mini.pairs").setup() -- auto-close brackets and quites
      require("mini.surround").setup() -- sa add, sd delete, sr replace surroundings
    end,
  },
  {
    -- Press <leader> and wait: a menu of every mapping appears.
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>a", group = "claude" },
        { "<leader>b", group = "buffer" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "git change" },
        { "<leader>o", group = "obsidian" },
        { "<leader>s", group = "split" },
      },
    },
  },
}
