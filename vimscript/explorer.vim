let g:netrw_keepdir = 0
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

function! NetrwMapping()
    nmap <buffer> <TAB> <CR>
endfunction

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END
