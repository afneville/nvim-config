vim.keymap.set("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.keymap.set("n", "K", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("n", "<CR>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<C-n>", { expr = true })
vim.keymap.set("i", "<C-k>", "<C-p>", { expr = true })
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })
vim.keymap.set("n", "<CR>", "<NOP>", { silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>x", ":bd<CR>")
vim.keymap.set("n", "<leader>X", ":bd!<CR>")

vim.api.nvim_set_keymap("n", "<space>d", "", {
  noremap = true,
  callback = function()
    for _, client in ipairs(vim.lsp.get_clients()) do
      require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
    end
  end,
})
