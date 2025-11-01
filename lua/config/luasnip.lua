local luasnip = require("luasnip")

luasnip.setup({ enable_autosnippets = true })
require("luasnip.loaders.from_vscode").lazy_load({
  paths = "~/.config/nvim/snippets",
})

vim.keymap.set({ "i" }, "<C-l>", function()
  luasnip.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-c>", function()
  luasnip.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-v>", function()
  luasnip.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { silent = true })
