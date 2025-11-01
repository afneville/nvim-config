vim.cmd("filetype indent plugin on")

local filetype_settings_augroup = vim.api.nvim_create_augroup("FileTypeSettings", { clear = true })

local plugin_ui_augroup = vim.api.nvim_create_augroup("PluginUIBuffers", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = filetype_settings_augroup,
  pattern = "man",
  callback = function()
    vim.bo.cursorcolumn = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = filetype_settings_augroup,
  pattern = {
    "javascript",
    "html",
    "css",
    "scss",
    "json",
    "tex",
    "typescriptreact",
    "typescript",
    "lua",
    "text",
    "markdown",
  },
  callback = function()
    if not vim.b.editorconfig then
      vim.bo.tabstop = 2
      vim.bo.shiftwidth = 2
      vim.bo.expandtab = true
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = filetype_settings_augroup,
  pattern = "go",
  callback = function()
    if not vim.b.editorconfig then
      vim.bo.expandtab = false
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = filetype_settings_augroup,
  pattern = "python",
  callback = function()
    if not vim.b.editorconfig then
      vim.bo.tabstop = 4
      vim.bo.shiftwidth = 4
      vim.bo.expandtab = true
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "copilot-*",
  callback = function()
    vim.opt_local.cursorcolumn = false
    vim.opt_local.cursorline = false
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = plugin_ui_augroup,
  pattern = { "fzf", "qf" },
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<C-k>", "k", { buffer = true })
    vim.keymap.set("n", "<C-j>", "j", { buffer = true })
    vim.keymap.set("n", "q", ":q<CR>", { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = plugin_ui_augroup,
  pattern = "TelescopePrompt",
  callback = function()
    if pcall(require, "cmp") then
      require("cmp").setup.buffer({ enabled = false })
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.terraformrc", "*.terraform.rc", "*.hcl" },
  callback = function()
    vim.bo.filetype = "hcl"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.bo.filetype = "terraform"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.tfstate", "*.tfstate.backup" },
  callback = function()
    vim.bo.filetype = "json"
  end,
})

local spell_enabled_filetypes = {
  markdown = true,
  gitcommit = true,
  text = true,
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  desc = "Enable spell check for specific filetypes",
  callback = function(args)
    if spell_enabled_filetypes[args.match] then
      vim.wo.spell = true
    else
      vim.wo.spell = false
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.b.editorconfig and vim.b.editorconfig.max_line_length then
      vim.opt_local.textwidth = 0
      vim.wo.colorcolumn = tostring(vim.b.editorconfig.max_line_length)
    else
      vim.opt_local.textwidth = 0
      vim.wo.colorcolumn = "0"
    end
  end,
})
