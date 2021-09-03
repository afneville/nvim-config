CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

O = {

    document_highlight = true,
    auto_close_tree = 1,
    auto_complete = true,
    colorscheme = 'nord',
    hidden_files = true,
    wrap_lines = false,
    number = true,
    relative_number = true,
    shell = 'zsh',
	timeoutlen = 100,
    nvim_tree_disable_netrw = 0,
    extras = true,

    treesitter = {
        ensure_installed = "all",
        ignore_install = {},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = true}
    },

    database = {save_location = '~/.config/nvim_db', auto_execute = 1},

    python = {
        linter = nil,
        formatter = nil,
        autoformat = false,
        isort = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
		analysis = {type_checking = false, auto_search_paths = true, use_library_code_types = true}
    },

    lua = {
        formatter = 'lua-format',
        autoformat = false,
        -- diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
        diagnostics = false,
    },

    sh = {
        linter = '',
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true}
    },

    css = {
        formatter = '',
        autoformat = false,
        virtual_text = true
    },

    tsserver = {linter = nil,
        formatter = 'prettier',
        autoformat = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true}
    },

    json = {
        formatter = 'prettier',
        autoformat = true,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true}
    },

    clang = {
        diagnostics = {virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true}
    },

	dashboard = {
		custom_header = {


        ' ███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ',
        ' ████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ',
        ' ██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╝██║ ',
        ' ██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╝ ██║ ',
        ' ██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║     ██║ ',
        ' ╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ',

		},
		footer= {''}
	}
}
