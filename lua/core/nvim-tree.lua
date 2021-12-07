vim.cmd("let g:nvim_tree_quit_on_open = 1")
vim.cmd("let g:nvim_tree_indent_markers = 1")
vim.cmd("let g:nvim_tree_git_hl = 0")
vim.cmd("let g:nvim_tree_highlight_opened_files = 1")
vim.cmd("let g:nvim_tree_root_folder_modifier = ':~'")
vim.cmd("let g:nvim_tree_add_trailing = 1")
vim.cmd("let g:nvim_tree_group_empty = 1")
vim.cmd("let g:nvim_tree_disable_window_picker = 1")
vim.cmd("let g:nvim_tree_icon_padding = ' '")
vim.cmd("let g:nvim_tree_symlink_arrow = ' >> '")
vim.cmd("let g:nvim_tree_respect_buf_cwd = 1")
vim.cmd("let g:nvim_tree_create_in_closed_folder = 0")
vim.cmd("let g:nvim_tree_refresh_wait = 500")
vim.cmd([[
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 0,
    \ }
]])
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  nvim_tree_gitignore = true,
  -- disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}
