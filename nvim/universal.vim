autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
set termguicolors

set splitbelow
set splitright
syntax on "Universal settings since the first day i got vim set incsearch " search as characters are entered
set autoread
let python_host_prog  ="/usr/bin/python2.7"
let python3_host_prog  ="/usr/bin/python3"
set hlsearch  " highlight matches
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set ruler
set formatoptions+=o
" Continue comment marker in new lines. set shiftwidth=4        " Indentation amount for < and > commands. set autoindent set smartindent set cindent
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
"Remove trailing space
autocmd BufWritePre * %s/\s\+$//e
autocmd VimEnter * :filetype detect
autocmd VimEnter * :syntax on
autocmd VimEnter * :IndentGuidesToggle
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
autocmd TermEnter startinsert


let g:go_fmt_command = "goimports"

" Statu line types/signatures.
let g:go_auto_type_info = 1

" Keybinds

let g:terminal_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

":setlocal foldmethod=syntax let g:mkdp_auto_start = 0 set autochdir
set scrolloff=50
let g:Illuminate_delay = 250


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')







" https://gist.github.com/LinArcX/0aba3e0d5876a0e2f856c0bb92c77573
"-------------------------------------------------------"
function! CreateCenteredFloatingWindow(command)
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    execute "normal mq"
    execute nvim_open_win(0,v:true, opts)
    execute "normal `q"
    execute "normal " . a:command
endfunction

let g:ft_man_open_mode = 'vert'

vmap <leader>p  <Plug>(coc-format-selected)
"suggest.enablePreview":~
