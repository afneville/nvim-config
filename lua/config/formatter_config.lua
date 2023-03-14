-- Utilities for creating configurations
local util = require("formatter.util")
local formatters = {}
formatters.prettier = function()
    return {
        exe = "prettier",
        args = {
            "--bracket-same-line",
            "--no-bracket-spacing",
            "--html-whitespace-sensitivity",
            "ignore",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
        },
        stdin = true,
    }
end
formatters.stylua = function()
    return {
        exe = "stylua",
        args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "4",
            "--quote-style",
            "AutoPreferDouble",
            "--call-parentheses",
            "Always",
            "--column-width",
            "80",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
        },
        stdin = true,
    }
end
formatters.clang = function()
    return {
        exe = "clang-format",
        args = {
            "--style",
            '"{BasedOnStyle: llvm, IndentWidth: 4}"',
            "--assume-filename",
            util.escape_path(util.get_current_buffer_file_name()),
        },
        stdin = true,
    }
end
formatters.black = function()
    return {
        exe = "black",
        args = { "-q", "-" },
        stdin = true,
    }
end

require("formatter").setup({
    logging = false,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {
            formatters.stylua,
        },
        c = {
            formatters.clang,
        },
        cpp = {
            formatters.clang,
        },
        html = {
            formatters.prettier,
        },
        javascript = {
            formatters.prettier,
        },
        css = {
            formatters.prettier,
        },
        python = {
            formatters.black,
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})

-- vim.cmd("autocmd BufWritePost * FormatWrite")
