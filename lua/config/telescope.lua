local actions = require("telescope.actions")

local picker_config = {
  prompt_title = false,
  results_title = false,
  preview_title = false,
}

require("telescope").setup({
  defaults = {
    -- borderchars = {
    --   "─",
    --   "│",
    --   "─",
    --   "│",
    --   "╭",
    --   "╮",
    --   "╯",
    --   "╰",
    -- },
    -- preview = true,
    borderchars = {
      prompt = {
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
      },
      results = {
        " ",
        " ",
        "_",
        " ",
        " ",
        " ",
        " ",
        " ",
      },
      preview = {
        " ",
        " ",
        "_",
        " ",
        " ",
        " ",
        " ",
        " ",
      },
    },
    -- preview = true,
    preview = {
      hide_on_startup = false,
    },
    prompt_title = false,
    results_title = false,
    preview_title = false,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-Bslash>"] = require("telescope.actions.layout").toggle_preview,
        ["<C-_>"] = require("telescope.actions.layout").cycle_layout_next,
        ["<ESC>"] = actions.close,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        border = true,
        preview_cutoff = 0,
        preview_height = 0.5,
        width = { padding = 0 },
        height = { padding = 0 },
      },
      horizontal = {
        preview_cutoff = 0,
        width = { padding = 0 },
        height = { padding = 0 },
      },
    },
  },
  pickers = {
    find_files = picker_config,
    buffers = picker_config,
    live_grep = picker_config,
    current_buffer_fuzzy_find = picker_config,
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

require("telescope").load_extension("fzf")

vim.keymap.set("n", "<leader>o", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", { silent = true })

vim.keymap.set("n", "<leader>s", ":Telescope grep_string<CR>", { silent = true })

vim.keymap.set("v", "<leader>s", ":Telescope grep_string<CR>", { silent = true })
