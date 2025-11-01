local util = require("formatter.util")

local function clangformat()
  return {
    exe = "clang-format",
    args = {
      "--style",
      '"{BasedOnStyle: llvm, IndentWidth: 4, AccessModifierOffset: -4}"',
      "-assume-filename",
      util.escape_path(util.get_current_buffer_file_name()),
    },
    stdin = true,
  }
end

local function latexindent()
  return {
    exe = "latexindent",
    args = {
      "-l",
      "~/.config/nvim/utils/indentconfig.yaml",
      "-m",
      "-",
    },
    stdin = true,
  }
end

local function shfmt()
  return {
    exe = "shfmt",
    args = { "-i", "4", "-ci" },
    stdin = true,
  }
end

local filetypes = {
  lua = {
    require("formatter.filetypes.lua").stylua,
  },
  python = {
    require("formatter.filetypes.python").black,
  },
  go = {
    require("formatter.filetypes.go").gofmt,
  },
  terraform = {
    require("formatter.filetypes.terraform").terraformfmt,
  },
  c = {
    clangformat,
  },
  cpp = {
    clangformat,
  },
  tex = {
    latexindent,
  },
  sh = {
    shfmt,
  },
  java = {
    clangformat,
  },
}

local prettier_languages = {
  "json",
  "jsonc",
  "yaml",
  "html",
  "css",
  "scss",
  "graphql",
  "typescript",
  "markdown",
  "angular",
  "svelte",
  "vue",
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
}

for _, ft in ipairs(prettier_languages) do
  filetypes[ft] = { require("formatter.filetypes." .. ft).prettier }
end

print(filetypes)

require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = filetypes,
})
