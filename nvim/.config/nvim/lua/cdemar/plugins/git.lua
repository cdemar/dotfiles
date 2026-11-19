-- Git changes in the gutter. The fastest way to review what Claude just edited.
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(buffer)
      local gs = require("gitsigns")
      local function map(keys, fn, desc)
        vim.keymap.set("n", keys, fn, { buffer = buffer, desc = desc })
      end
      map("]h", function() gs.nav_hunk("next") end, "Next change")
      map("[h", function() gs.nav_hunk("prev") end, "Previous change")
      map("<leader>hp", gs.preview_hunk, "Preview change")
      map("<leader>hs", gs.stage_hunk, "Stage change")
      map("<leader>hr", gs.reset_hunk, "Undo change")
      map("<leader>hb", gs.blame_line, "Blame line")
      map("<leader>hd", gs.diffthis, "Diff file")
    end,
  },
}
