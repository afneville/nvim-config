local cmp = require'cmp'
local luasnip = require("luasnip")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    enabled = function()
      -- disable completion in comments
      local context = require 'cmp.config.context'
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == 'c' then
        return true
      else
        return not context.in_treesitter_capture("comment")
          and not context.in_syntax_group("Comment")
      end
    end,
    snippet = { -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    -- snippet = {
    --     -- We recommend using *actual* snippet engine.
    --     -- It's a simple implementation so it might not work in some of the cases.
    --     expand = function(args)
    --       local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
    --       local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
    --       local indent = string.match(line_text, '^%s*')
    --       local replace = vim.split(args.body, '\n', true)
    --       local surround = string.match(line_text, '%S.*') or ''
    --       local surround_end = surround:sub(col)
    --       replace[1] = surround:sub(0, col - 1)..replace[1]
    --       replace[#replace] = replace[#replace]..(#surround_end > 1 and ' ' or '')..surround_end
    --       if indent ~= '' then
    --         for i, line in ipairs(replace) do
    --           replace[i] = indent..line
    --         end
    --       end
    --       vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
    --     end,
    --   },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = {
            border = "single"
        }
    },
    mapping = cmp.mapping.preset.insert({
        -- ['<C-Space>'] = cmp.mapping.confirm {
        --       behavior = cmp.ConfirmBehavior.Insert,
        --       select = true,
        -- },
        -- 
        -- ['<Tab>'] = function(fallback)
        --   if not cmp.select_next_item() then
        --     if vim.bo.buftype ~= 'prompt' and has_words_before() then
        --       cmp.complete()
        --     else
        --       fallback()
        --     end
        --   end
        -- end,
        -- 
        -- ['<S-Tab>'] = function(fallback)
        --   if not cmp.select_prev_item() then
        --     if vim.bo.buftype ~= 'prompt' and has_words_before() then
        --       cmp.complete()
        --     else
        --       fallback()
        --     end
        --   end
        -- end,
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
            end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
        end, { "i", "s" }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        -- { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
})

-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })
-- 
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })
