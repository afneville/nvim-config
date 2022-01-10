local netrw_extension = { sections = { lualine_a = {}, lualine_b = {}, lualine_c = {}, lualine_x = {}, lualine_y = {}, lualine_z = {}}, filetypes = {'netrw'}}
require('lualine').setup {
    options = {
        theme = 'vscode',
        section_separators = {'', ''},
        component_separators = {'', ''},
        diabled_filetypes = {'netrw'}
    },
    extensions = {
        netrw_extension
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    }
}
