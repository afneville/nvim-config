require("nvim-treesitter.configs").setup({
    -- ensure_installed = "all",
    -- ensure_installed = { "lua", "bash" },

    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "cuda",
        "diff",
        "dockerfile",
        "dot",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "html",
        "ini",
        "java",
        "javascript",
        "json",
        "latex",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "nix",
        "php",
        "python",
        "rst",
        "sql",
        "sxhkdrc",
        "typescript",
        "vim",
        "vimdoc",
    },

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
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
