let mapleader = ","
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
set termguicolors

set splitbelow
set splitright
syntax on

"Universal settings since the first day i got vim
set incsearch " search as characters are entered
set autoread
let python_host_prog  ="/usr/bin/python2.7"
let python3_host_prog  ="/usr/bin/python3"
set hlsearch  " highlight matches
set showmatch           " Show matching brackets. set number              " Show the line numbers on the left side. set ruler set formatoptions+=o    " Continue comment marker in new lines. set shiftwidth=4        " Indentation amount for < and > commands. set autoindent
set smartindent
set cindent
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
"Remove trailing space
autocmd BufWritePre * %s/\s\+$//e
autocmd VimEnter * :filetype detect
autocmd VimEnter * :syntax on
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
    set scrolloff=5       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.
set mouse=a
let g:sneak#label = 1
let g:auto_save = 1  " enable AutoSave on Vim startup
set clipboard+=unnamedplus
nnoremap <esc> :noh<CR>



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




" CoC conf
"
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

autocmd FileType json,go syntax match Comment +\/\/.\+$+


let g:go_fmt_command = "goimports"

" Statu line types/signatures.
let g:go_auto_type_info = 1

" Keybinds

let g:terminal_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


":setlocal foldmethod=syntax
let g:mkdp_auto_start = 0

"autocmd FileType go :TagbarToggle
