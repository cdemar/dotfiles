-- Language servers give you go-to-definition, rename, errors, and completion data.
-- mason.nvim downloads the servers and formatters
-- nvim-lspconfig ships a default config for each server
-- neovim itself runs them (vim.lsp.enable)
local profile = require("cdemar.profile")

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = { { "mason-org/mason.nvim", opts = {} } },
  config = function()
    -- Install anything from the profile that is missing.
    local registry = require("mason-registry")
    registry.refresh(function()
      local pachages = vim.list_extend(vim.tbl_values(profile.servers), profile.tools)
      for _, name in ipairs(pachages) do
        local ok, pkg = pcall(registry.get_package, name)
        if not ok then
          vim.notify("Mason has no pachage name " .. name, vim.log.levels.WARN)
        elseif not pkg:is_installed() and not pkg:is_installing() then
          pkg:install()
        end
      end
    end)

    -- Tech the Lua server about the `vim` global so this config has no false errors.
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim", "Snacks" } },
          workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
        },
      },
    })

    vim.lsp.enable(vim.tbl_keys(profile.servers))

    vim.diagnostic.config({
      virtual_text = true, -- show the error message at the end of the line
      severity_sort = true,
    })

    -- Neovim already maps: K hover, grn rename, gra code action, grr references,
    -- gri implementation, gO document symbols, [d and ]d previous/next diognostic.
    -- These two swap the plain lists for the fuzzy picker.
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local function map(keys, fn, desc)
          vim.keymap.set("n", keys, fn, {buffer = event.buf, desc = desc })
        end
        map("gd", function() Snacks.picker.lsp_definitions() end, "Go to definition")
        map("gR", function() Snacks.picker.lsp_references() end, "Show refrences")
      end,
    })
  end,
}
