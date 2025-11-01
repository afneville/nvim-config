local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  enabled = function()
    local context = require("cmp.config.context")
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
    end
  end,
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,Search:None",
      border = "single",
    },
    documentation = {
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,Search:None",
      border = "single",
    },
  },
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = "noselect",
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "luasnip" },
    { name = "copilot" },
    { name = "nvim_lsp_signature_help" },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = "text",
      menu = {
        buffer = "[BUF]",
        nvim_lsp = "[LSP]",
        luasnip = "[SNP]",
        nvim_lua = "[LUA]",
        latex_symbols = "[TEX]",
      },
    }),
  },
})
