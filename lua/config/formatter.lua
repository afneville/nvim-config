local util = require("formatter.util")

function clangformat()
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

function latexindent()
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

function stylua()
  return {
    exe = "stylua",
    args = {
      "--search-parent-directories",
      "--stdin-filepath",
      util.escape_path(util.get_current_buffer_file_path()),
      "--indent-type",
      "Spaces",
      "--indent-width",
      "2",
      "--quote-style",
      "AutoPreferDouble",
      "--call-parentheses",
      "Always",
      "--column-width",
      "72",
      "--",
      "-",
    },
    stdin = true,
  }
end

function prettier(ft)
  return {
    exe = "prettier",
    args = {
      "--bracket-same-line",
      "--no-bracket-spacing",
      "--prose-wrap",
      "always",
      "--trailing-comma",
      "none",
      "--print-width",
      "72",
      "--html-whitespace-sensitivity",
      "ignore",
      "--stdin-filepath",
      util.escape_path(util.get_current_buffer_file_path()),
      "--parser",
      ft,
    },
    stdin = true,
  }
end

function shfmt()
  return {
    exe = "shfmt",
    args = { "-i", "4", "-ci" },
    stdin = true,
  }
end

require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      stylua(),
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    go = {
      require("formatter.filetypes.go").gofmt,
    },
    c = {
      clangformat,
    },
    cpp = {
      clangformat,
    },
    json = {
      util.withl(prettier, "json"),
    },
    jsonc = {
      util.withl(prettier, "jsonc"),
    },
    yaml = {
      util.withl(prettier, "yaml"),
    },
    html = {
      util.withl(prettier, "html"),
    },
    css = {
      util.withl(prettier, "css"),
    },
    scss = {
      util.withl(prettier, "scss"),
    },
    graphql = {
      util.withl(prettier, "graphql"),
    },
    javascript = {
      util.withl(prettier, "typescript"),
    },
    typescript = {
      util.withl(prettier, "typescript"),
    },
    javascriptreact = {
      util.withl(prettier, "typescript"),
    },
    typescriptreact = {
      util.withl(prettier, "typescript"),
    },
    markdown = {
      util.withl(prettier, "markdown"),
    },
    tex = {
      latexindent,
    },
    sh = {
      shfmt
    },
    java = {
      clangformat
    },
    terraform = {
      require("formatter.filetypes.terraform").terraformfmt,
    }
  },
})
