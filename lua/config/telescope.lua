local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        prompt_title = "",
        borderchars = {
            "─",
            "│",
            "─",
            "│",
            "┌",
            "┐",
            "┘",
            "└",
        },
        -- preview = true,
        preview = {
            hide_on_startup = true,
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-Bslash>"] = require('telescope.actions.layout').toggle_preview,
                ["<C-_>"] = require('telescope.actions.layout').cycle_layout_next,
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
                preview_height = 0.25,
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
        find_files = {
            prompt_title = false,
            results_title = false,
            preview_title = false,
        }
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
})

-- telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>bb", ":Telescope buffers<CR>")
vim.keymap.set(
    "n",
    "<leader>ss",
    ":Telescope current_buffer_fuzzy_find<CR>"
)

require("telescope").load_extension("fzf")
