
" E shit
"
"
let g:rainbow_active = 1
set background=light
colorscheme nord


let g:lightline = {
      \ 'colorscheme': 'nord',
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
let g:lightline.tabline = {
	\ 'left': [ [ 'tabs' ] ],
	\ 'right': [ [ 'close' ] ] }


