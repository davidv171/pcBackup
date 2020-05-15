
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'

"Plug 'zxqfl/tabnine-vim'

"Plug 'itspriddle/vim-shellcheck'

    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'arcticicestudio/nord-vim'
    Plug 'itchyny/lightline.vim'
    Plug 'taohexxx/lightline-buffer'
    Plug 'kshenoy/vim-signature'
    "Plug 'majutsushi/tagbar'


    "    Plug 'vim-syntastic/syntastic'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
"
    Plug 'tmsvg/pear-tree'
    Plug 'vim-syntastic/syntastic'
    Plug 'lervag/vimtex'

call plug#end()
set hidden
let g:buftabline_numbers=2
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

set background=light
colorscheme nord

" Lightline
set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline

" use lightline-buffer in lightline
let g:lightline = {
    \'colorscheme':'nord',
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ }

" remap arrow keys
nnoremap H :bprev<CR>
nnoremap L :bnext<CR>

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" enable devicons, only support utf-8
" require <https://github.com/ryanoasis/vim-devicons>
let g:lightline_buffer_enable_devicons = 1

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 2

" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'

" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']

" max file name length
let g:lightline_buffer_maxflen = 30

" max file extension length
let g:lightline_buffer_maxfextlen = 3

" min file name length
let g:lightline_buffer_minflen = 16

" min file extension length
let g:lightline_buffer_minfextlen = 3

" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20

let mapleader = " "
let maplocalleader = " "
"
"
"
"
"
" Universal configuration
"
"
"
"
"

set termguicolors

set splitbelow
set splitright
syntax on "Universal settings since the first day i got vim

set incsearch " search as characters are entered
set autoread
let python_host_prog  ="/usr/bin/python2.7"
let python3_host_prog  ="/usr/bin/python3"
set hlsearch  " highlight matches
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set ruler
set formatoptions+=o
" Continue comment marker in new lines.
set shiftwidth=4
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
  function! CreateCenteredFloatingWindow() abort
      let width = float2nr(&columns * 0.6)
      let height = float2nr(&lines * 0.6)
      let top = ((&lines - height) / 2) - 1
      let left = (&columns - width) / 2
      let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

      set winhl=Normal:Floating
      let opts.row += 1
      let opts.height -= 2
      let opts.col += 2
      let opts.width -= 4
      call nvim_open_win(0, v:true, opts)
      au BufWipeout <buffer> exe 'bw '.s:buf
  endfunction

let g:ft_man_open_mode = 'vert'















function! FloatScroll(forward) abort
  let float = coc#util#get_float()
  if !float | return '' | endif
  let buf = nvim_win_get_buf(float)
  let buf_height = nvim_buf_line_count(buf)
  let win_height = nvim_win_get_height(float)
  if buf_height < win_height | return '' | endif
  let pos = nvim_win_get_cursor(float)
  if a:forward
    if pos[0] == 1
      let pos[0] += 3 * win_height / 4
    elseif pos[0] + win_height / 2 + 1 < buf_height
      let pos[0] += win_height / 2 + 1
    else
      let pos[0] = buf_height
    endif
  else
    if pos[0] == buf_height
      let pos[0] -= 3 * win_height / 4
    elseif pos[0] - win_height / 2 + 1  > 1
      let pos[0] -= win_height / 2 + 1
    else
      let pos[0] = 1
    endif
  endif
    call nvim_win_set_cursor(float, pos)
return ''
endfunction

inoremap <silent><expr> <down> coc#util#has_float() ? FloatScroll(1) : "\<down>"
inoremap <silent><expr>  <up>  coc#util#has_float() ? FloatScroll(0) :  "\<up>"




"Keybinds
"
autocmd FileType sh nnoremap <Leader>sc :!shellcheck %<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap J <C-W>j
"xnoremap <silent> ( <ESC>:let p = &paste<CR>:set paste<CR>:let a = line2byte(line('.')) + col('.')<CR>gvc()<ESC>:if getregtype() ==# 'V'<CR>call setreg('"', substitute(@", '\n$', '', ''), 'c')<CR>endif<CR>P:exe "goto ".a<CR>:exe "let &paste=".p<CR> :imap kj <Esc>
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
inoremap <silent> <C-b> <Plug>(coc-definition)
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <leader>gi :!goimports -w %<CR>
"map <C-a> <esc>ggVG<CR>
inoremap <C-s> :w<CR>
nmap <silent> <leader>td <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)

nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <silent> <leader>u <Plug>(coc-references)

nmap <silent> <leader>dp <Plug>(coc-diagnostic-prev)

nmap <silent> <leader>dd <Plug>(coc-diagnostic-prev)


nmap <silent> <leader>dh <Plug>(coc-diagnostic-prev)

nmap <silent> <leader>dn <Plug>(coc-diagnostic-prev)

nmap <silent> <leader>D <Plug>(coc-diagnostic-prev)

nmap <silent> <leader>dl <Plug>(coc-diagnostic-prev)

autocmd FileType go nmap <leader>gt :CocCommand go.test.generate.file<cr>

nmap <silent> <leader>fw :w!<CR>
nmap <silent> <leader>fq :q!<CR>
nmap <leader>cd :cd /home/davidv7/<CR>
nmap <leader>cb :cd ..<CR>
nmap <silent> <leader>fb :Files<CR>
nmap <leader>tt :!setxkbmap -option caps:escape<CR>
nmap <leader>ll :!ls %:p<CR>

nnoremap <leader>cc :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>cf :Files %:p:h<CR>
nnoremap <leader>ch :Files /home/davidv7/<CR>
nnoremap <leader>cv :Files /home/davidv7/.config/<CR>

"nmap <leader>to :TagbarToggle<CR>
"nmap <leader>ts :TagbarShowTag<CR>
nmap <leader>, :Rg<CR>
nmap <leader>fi :Rg<CR>
nmap <leader>hi :History<CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <F2> <Plug>(coc-diagnostic-prev)
nmap <silent> <F3> <Plug>(coc-diagnostic-next)
nnoremap ; <Esc>A;
    " 'quote' a word

" double "quote" a word
nnoremap <leader>qw :silent! normal Ea"<Esc>Bi"

" Parenthesize word around it
nnoremap <leader>sp :silent! normal Ea)<ESc>Bi( " unsurround word, works on anything on left and right side of Word
nnoremap <leader>us normal EdlBdh
nnoremap , `
" remove quotes from a word
"nnoremap wq :silent! normal mpeld bhd `ph<CR>
nnoremap ql :silent! normal mpEA"<Esc>bi"<Esc>`pl



nnoremap <A-r> :source ~/.config/nvim/init.vim<CR>
"nnoremap <A-p> :MarkdownPreview<CR>
nnoremap <Esc> :noh<CR>
nnoremap <leader>rw :!chmod u+rw %<CR>
nnoremap <leader>ts :sp<Esc><C-w>j<CR>:resize 10<Esc>:terminal<CR>
tnoremap <Esc> <C-\><C-n>




augroup customize_floating_windows
    au!
    au BufNew * au OptionSet buftype ++once if has_key(nvim_win_get_config(0), 'anchor')
        \ | exe 'nno <buffer><nowait><silent> <esc> :<c-u>q!<cr>'
        \ | endif
augroup END

nnoremap % v%


" splitting {{{
" internal helper for splitting naturally
fu! s:SplitHelper(f)
    if winwidth('%') >= (winheight('%') * 2)
        exec 'vsplit '.a:f
    else
        exec 'split '.a:f
    endif
endfu
"https://github.com/WillEccles/dotfiles/blob/master/vim/.vimrc#L22-L51
" split naturally with 0 or more files (0 == identical to calling either split
" or vsplit, depending on the current window size
fu! SplitNatural(...)
    if a:0 == 0
        call s:SplitHelper('')
    else
        for fname in a:000
            call s:SplitHelper(fname)
        endfor
    endif
endfu

" use :S <filenames...> to open 1 or more splits in a 'natural' way
" this can be used with no args, which is identical to just calling a split
" function
command! -nargs=* -complete=file S call SplitNatural(<f-args>)

set splitright
set splitbelow
" end splitting }}}
"
"

nnoremap <leader>sn :call SplitNatural()<CR>
nnoremap <leader>sf :call CreateCenteredFloatingWindow()<CR>
nnoremap <leader>ft :call ToggleTerminal()<CR>





vmap <leader>p <Plug>(coc-format-selected)
nnoremap <leader>qa :qa!<CR>

nnoremap <leader>gb :ToggleBlameLine<CR>
nnoremap <leader>cal :pu=strftime('%c')<CR>

nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>


"nnoremap H :tabprev<CR>
"nnoremap L :tabn<CR>
nnoremap <Leader>K :bd<CR>




nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
"lua vim.api.nvim_command [[autocmd CursorHold   * lua require'utils'.blameVirtText()]]
"lua vim.api.nvim_command [[autocmd CursorMoved  * lua require'utils'.clearBlameVirtText()]]
"lua vim.api.nvim_command [[autocmd CursorMovedI * lua require'utils'.clearBlameVirtText()]]
"
"
"
" FZF CONFIG

" This is the default extra key bindings
    let g:fzf_action = {
      \ 'ctrl-g': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'


map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>ta :Tags<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <Leader>bl :BLines<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <A-x> :Commands<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.6, 'height': 0.4,'yoffset':0.0,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

"Get previews
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Rg previews
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Switch to buffer instead of opening a new one
let g:fzf_buffers_jump=1





" COLORSCHEME
"
"


" E shit
"
"

" Tabs bruh
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

nnoremap to :tabonly


nnoremap <C-y> 1gt<CR>
nnoremap <C-x> 2gt<CR>
nnoremap <C-b> 4gt<CR>
nnoremap <A-n> :tabnext<CR>
nnoremap <A-p> :tabprev<CR>


autocmd InsertLeave *.json setlocal conceallevel=2 concealcursor=inc















" Syntax checking
"
"

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


autocmd FileType bash,sh :SyntasticCheck<CR>








" Buffer line binds
"
" o
nmap <leader>1 :b1<CR>
nmap <leader>2 :b2<CR>
nmap <leader>3 :b3<CR>
nmap <leader>4 :b4<CR>
nmap <leader>5 :b5<CR>
nmap <leader>6 :b6<CR>
nmap <leader>7 :b7<CR>
nmap <leader>8 :b8<CR>
nmap <leader>9 :b9<CR>
nmap <leader>0 :b0<CR>








" LATEX
"
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
