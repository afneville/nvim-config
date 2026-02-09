require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    svelte = { "prettier" },
    tex = { "latexindent" },
    terraform = { "terraform_fmt" },
    hcl = { "terraform_fmt" },
    python = { "black" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    -- s = { "clang-format" },
    -- S = { "clang-format" },
    -- asm = { "clang-format" },
  },
  formatters = {
    prettier = {
      opts = {
        ft_parsers = {
          javascript = "babel",
          javascriptreact = "babel",
          typescript = "typescript",
          typescriptreact = "typescript",
          vue = "vue",
          css = "css",
          scss = "scss",
          less = "less",
          html = "html",
          json = "json",
          jsonc = "jsonc",
          yaml = "yaml",
          markdown = "markdown",
          svelte = "svelte",
        },
      },
    },
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
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
