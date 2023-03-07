require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<c-j>", -- set to `false` to disable one of the mappings
            node_incremental = "<c-j>",
            node_decremental = "<c-k>",
        },
    },
    indent = {
        enable = true,
        disable = { "python" },
    },
})
