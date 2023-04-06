require("mason").setup({
    ui = {
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "single",

        -- Width of the window. Accepts:
        -- - Integer greater than 1 for fixed width.
        -- - Float in the range of 0-1 for a percentage of screen width.
        width = 0.8,

        -- Height of the window. Accepts:
        -- - Integer greater than 1 for fixed height.
        -- - Float in the range of 0-1 for a percentage of screen height.
        height = 0.9,

        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },

        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = "<TAB>",
            -- Keymap to install the package under the current cursor position
            install_package = "<CR>",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "X",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
        },
    },
})
require("mason-lspconfig")
require("mason-tool-installer").setup({
    ensure_installed = {
        "typescript-language-server",
        "css-lsp",
        "eslint_d",
        "pyright",
        "shellcheck",
        "bash-language-server",
        "shfmt",
        "black",
        "jdtls",
        "clangd",
        "html-lsp",
        "lua-language-server",
        "stylua",
    },
    run_on_start = false,
})
