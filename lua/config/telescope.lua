local actions = require("telescope.actions")

local titles = {
  prompt_title = false,
  results_title = false,
  preview_title = false,
}

require("telescope").setup({
  defaults = {
    prompt_title = "",
    borderchars = {
      "─",
      "│",
      "─",
      "│",
      "╭",
      "╮",
      "╯",
      "╰",
    },
    -- preview = true,
    preview = {
      hide_on_startup = false,
    },
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
        preview_cutoff = 0,
        preview_height = 0.7,
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
    find_files = titles,
    buffers = titles,
    live_grep = titles,
    current_buffer_fuzzy_find = titles,
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
