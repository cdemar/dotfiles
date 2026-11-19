-- One config, two machines. Everything that differs between them lives here.
-- Pick a profile with `export NVIM_PROFILE=work` in ~/.zshenv (default: personal).
--
-- parsers Tree-sitter languages (syntax highlighting)
-- servers language server name = the Mason package that installs it
-- tools   extra Mason packages (formatters)
-- web     turn on JSX/HTML tag helpers

local  profiles = {
  personal = {
    parsers = {
      "lua", "vim", "vimdoc", "markdown", "markdown_inline", "bash", "json", "yaml", "gitignore",
      "javascript", "typescript", "tsx", "html", "css", "python", "sql", "dockerfile",
    },
    servers = {
      lua_ls = "lua-language-server",
      ts_ls = "typescript-language-server",
      eslint = "eslint-lsp",
      tailwindcss = "tailwindcss-language-server",
      html = "html-lsp",
      cssls = "css-lsp",
      jsonls = "json-lsp",
      basedpyright = "basedpyright",
      ruff = "ruff",
    },
    tools = { "prettier", "stylua" },
    web = true,
  },

  work = {
    -- Test automation (Playwright, Locust, ZAP, SonarQube, 508 checks) on a
    -- TypeScript/React front end and a Python/FastAPI/Postgres back end.
    parsers = {
      "lua", "vim", "vimdoc", "markdown", "markdown_inline", "bash", "json", "yaml", "gitignore",
      "python", "toml", -- FastAPI, Locust, Playwright for Python; pyproject.toml
      "javascript", "typescript", "tsx", "html", "css", -- React, Playwright for TypeScript
      "sql", "dockerfile", -- Postgres queries; reading the containers ZAP and the apps run in
    },
    servers = {
      lua_ls = "lua-language-server",
      basedpyright = "basedpyright", -- Python types: FastAPI models, Locust and Playwright tests
      ruff = "ruff", -- Python lint and format
      ts_ls = "typescript-language-server", -- TypeScript and React
      eslint = "eslint-lsp", -- the project's own lint rules, including accessibility rules if it uses them
      yamlls = "yaml-language-server", -- ZAP automation plans, CI pipelines
      jsonls = "json-lsp",
      bashls = "bash-language-server",
      -- Postgres: only starts in projects with a postgres-language-server.jsonc file.
      -- postgres_lsp = "postgres-language-server",
      -- DevOps, once approved:
      -- dockerls = "dockerfile-language-server",
      -- terraformls = "terraform-ls",
    },
    tools = { "prettier", "stylua", "shfmt" },
    web = true, -- React means JSX tags
  },
}

return profiles[vim.env.NVIM_PROFILE or "personal"] or profiles.personal
