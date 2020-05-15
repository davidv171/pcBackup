
" E shit
"
"

function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer          cterm=NONE      ctermbg=7 ctermfg=8 guibg=#d8dee9 guifg=#2e3440
	hi! BuffetActiveBuffer           cterm=NONE      ctermbg=7 ctermfg=8 guibg=#d8dee9 guifg=#2e3440
	hi! BuffetBuffer                 cterm=NONE      ctermbg=0 ctermfg=1 guibg=#2e3440 guifg=#d8dee9
	hi! BuffetModCurrentBuffer       cterm=NONE      ctermbg=1 ctermfg=8 guibg=#eceff4 guifg=#4c566a
	hi! BuffetModActiveBuffer        cterm=NONE      ctermbg=1 ctermfg=8 guibg=#eceff4 guifg=#4c566a
    hi! BuffetModBuffer              cterm=NONE      ctermbg=1 ctermfg=8 guibg=#5e81ac guifg=#eceff4
    hi! BuffetTrunc                  cterm=NONE      ctermbg=0 ctermfg=1 guibg=#2e3440 guifg=#d8dee9
    hi! BuffetTab                    cterm=NONE      ctermbg=0 ctermfg=1 guibg=#2e3440 guifg=#d8dee9

endfunction
let g:rainbow_active = 1
set background=light
colorscheme nord

" Lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'enable': {
      \   'tabline': 0
      \ }
\ }


let g:lightline.active = {
	\ 'left': [ [ 'mode', 'paste' ],
	\           [ 'readonly', 'relativepath', 'modified' ] ],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'percent' ],
	\            [ 'fileformat', 'fileencoding', 'filetype', 'L' ] ] }
let g:lightline.inactive = {
	\ 'left': [ [ 'filename' ] ],
	\ 'right': [ [ 'lineinfo' ],
	\            [ 'percent' ] ] }
" BUFFET
let g:buffet_show_index = 1
let g:buffet_use_devicons = 0
let g:buffet_tab_icon = "#"

