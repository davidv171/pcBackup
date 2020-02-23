autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
set termguicolors

set splitbelow
set splitright
syntax on
"Universal settings since the first day i got vim set incsearch " search as characters are entered
set autoread
let python_host_prog  ="/usr/bin/python2.7"
let python3_host_prog  ="/usr/bin/python3"
set hlsearch  " highlight matches
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set ruler
set formatoptions+=o
" Continue comment marker in new lines.
set shiftwidth=4        " Indentation amount for < and > commands. set autoindent
set smartindent
set cindent
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
"Remove trailing space
autocmd BufWritePre * %s/\s\+$//e
autocmd VimEnter * :filetype detect
autocmd VimEnter * :syntax on
" More natural splits
if !&scrolloff
    set scrolloff=10       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=10   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.
set mouse=a
let g:sneak#label = 1
let g:auto_save = 1  " enable AutoSave on Vim startup
set clipboard+=unnamedplus

filetype plugin on
set omnifunc=syntaxcomplete#Complete
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Flash screen instead of beep sound
set visualbell

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.


set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir




autocmd FileType json,go syntax match Comment +\/\/.\+$+
autocmd TermOpen * startinsert


let g:go_fmt_command = "goimports"

" Statu line types/signatures.
let g:go_auto_type_info = 1

" Keybinds

let g:terminal_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


":setlocal foldmethod=syntax
let g:mkdp_auto_start = 0
set autochdir


