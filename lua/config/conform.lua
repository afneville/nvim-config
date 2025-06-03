require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    yaml = { "prettier" },
    markdown = { "prettier" }
  },
  formatters = {
    stylua = {
      prepend_args = {
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
      },
    },
    prettier = {
      prepend_args = {
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
      }
    }
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line =
      vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({
    async = true,
    lsp_format = "fallback",
    range = range,
  })
end, { range = true })
vim.keymap.set("n", "<leader>f", ":Format<CR>")
