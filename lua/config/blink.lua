require("blink.cmp").setup({
  fuzzy = { implementation = "rust" },
  snippets = { preset = "luasnip" },
  keymap = {
    preset = "none",
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-c>"] = { "snippet_forward", "fallback" },
    ["<C-v>"] = { "snippet_backward", "fallback" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<C-]>"] = { "show", "hide", "fallback" },
    -- ['<C-]>'] = { "show", function(cmp) cmp.show({ providers = { 'snippets' } }) end, "hide", "fallback" },
    ["<C-e>"] = { "cancel", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<C-d>"] = { "show_documentation", "hide_documentation", "fallback" },
    ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
  },
  cmdline = {
    enabled = false,
    keymap = { preset = "inherit" },
    completion = { menu = { auto_show = true } },
  },
  signature = {
    enabled = true,
    -- window = { border = "single" },
    trigger = {
      enabled = true,
      show_on_insert = false,
      show_on_trigger_character = false,
    },
  },
  completion = {
    documentation = {
      auto_show = false,
      -- window = {
      --   border = "single",
      -- },
    },
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
    menu = {
      -- winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
      -- border = "single",
      draw = {
        columns = { { "label", "kind", gap = 1 }, { "source_name" } },
        components = {
          label = {
            width = { max = 40 },
          },
        },
      },
    },
  },
  sources = {
    default = function(ctx)
      _ = ctx
      local success, node = pcall(vim.treesitter.get_node)
      if success and node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
        return { "path", "buffer", "snippets" }
      else
        return { "lsp", "path", "buffer", "snippets" }
      end
    end,
    providers = {
      -- copilot = {
      --   name = "AI",
      --   module = "blink-copilot",
      --   score_offset = 100,
      --   async = true,
      -- },
      snippets = {
        name = "SNIP",
        module = "blink.cmp.sources.snippets",
      },
      path = {
        name = "PATH",
        module = "blink.cmp.sources.path",
      },
      lsp = {
        name = "LSP",
        module = "blink.cmp.sources.lsp",
      },
      buffer = {
        name = "BUFF",
        module = "blink.cmp.sources.buffer",
      },
    },
  },
})
