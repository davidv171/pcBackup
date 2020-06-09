
call plug#begin('~/.local/share/nvim/plugged')

    Plug 'airblade/vim-gitgutter'

"Plug 'zxqfl/tabnine-vim'

"Plug 'itspriddle/vim-shellcheck'

    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'NLKNguyen/papercolor-theme'
    "Plug 'arcticicestudio/nord-vim'
    Plug 'ayu-theme/ayu-vim'
    Plug 'itchyny/lightline.vim'
    "Plug 'taohexxx/lightline-buffer'
    Plug 'kshenoy/vim-signature'
    "Plug 'majutsushi/tagbar'


    "    Plug 'vim-syntastic/syntastic'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
"
    Plug 'tmsvg/pear-tree'
    Plug 'vim-syntastic/syntastic'
    Plug 'lervag/vimtex'
    Plug 'justinmk/vim-dirvish'

call plug#end()
set hidden
let g:buftabline_numbers=2
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

"set background=light
set termguicolors " if you want to run vim in a terminal
set background=light

" Lightline
set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"colorscheme ayu
set background=light
colorscheme PaperColor

let g:lightline = {
    \'colorscheme':'PaperColor',
      \ 'tab_component_function': {
      \   'filename': 'MyTabFilename'
      \  }
\ }

function! MyTabFilename(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnum = buflist[winnr - 1]
  let bufname = expand('#'.bufnum.':t')
  let buffullname = expand('#'.bufnum.':p')
  let buffullnames = []
  let bufnames = []
  for i in range(1, tabpagenr('$'))
    if i != a:n
      let num = tabpagebuflist(i)[tabpagewinnr(i) - 1]
      call add(buffullnames, expand('#' . num . ':p'))
      call add(bufnames, expand('#' . num . ':t'))
    endif
  endfor
  let i = index(bufnames, bufname)
  if strlen(bufname) && i >= 0 && buffullnames[i] != buffullname
    return substitute(buffullname, '.*/\([^/]\+/\)', '\1', '')
  else
    return strlen(bufname) ? bufname : '[No Name]'
  endif
endfunction
nnoremap H :bprev<CR>
nnoremap L :bnext<CR>

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






"let g:go_fmt_command = "goimports"

" Statu line types/signatures.
let g:go_auto_type_info = 1

" Keybinds
inoremap <silent><expr> <c-space> coc#refresh()

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
inoremap <C-s> :w!<CR>
nmap <silent> <leader>td <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)

nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <silent> <leader>u <Plug>(coc-references)


autocmd FileType go nmap <leader>gt :CocCommand go.test.generate.file<cr>

command! CapsEscape :!setxkbmap -option caps:escape<CR>
nnoremap <leader>ll :!ls %:p<CR>

nnoremap <leader>cc :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>cf :Files %:p:h<CR>
nnoremap <leader>cg  :cd `git rev-parse --show-toplevel`<CR>

"nmap <leader>to :TagbarToggle<CR>
"nmap <leader>ts :TagbarShowTag<CR>
nmap <leader>, :Rg<CR>

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
command! ReadWrite :!chmod u+rw %<CR>
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

fu! NewTabAndCmd(cmd)
    exec 'tabnew' | call execute(a:cmd)
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
"nnoremap <leader>sf :call CreateCenteredFloatingWindow()<CR>
"nnoremap <leader>ft :call ToggleTerminal()<CR>





vmap <leader>p <Plug>(coc-format-selected)
nnoremap <leader>qa :qa!<CR>

"nnoremap <leader>gb :ToggleBlameLine<CR>
command! Calendar :pu=strftime('%c')<CR>

nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>

"nnoremap H :tabprev<CR>
"nnoremap L :tabn<CR>




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
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>ta :Tags<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <Leader>fb :BLines<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <A-x> :Commands<CR>


let g:fzf_tags_command = 'ctags -R'
autocmd FileType go :let g:fzf_tag_command = 'gotags -R'
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





autocmd InsertLeave *.json setlocal conceallevel=2 concealcursor=inc















" Syntax checking
"
"

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


autocmd FileType bash,sh :SyntasticCheck<CR>









" LATEX
"
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'


command! LatexCompile :!latexmk -pdf


" Gamer moment stuff
"
" Excited soy screeching noises
"vnoremap + v_g_CTRL-A
"
noremap + <C-a>
vnoremap + g<C-a>

" COC complains...
"autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

nnoremap H gT
nnoremap L gt

noremap  <C-l> <C-w>l<CR>
nnoremap <C-h> <C-w>h<CR>
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-k> <C-w>k<CR>
set autochdir

"nnoremap <Leader>k :bd<CR>
" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-TAB> :exe "tabn ".g:lasttab<cr>


" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


set switchbuf=useopen,usetab


nnoremap <leader>dt :call CocAction('jumpDefinition', 'tab drop')<CR>
nnoremap <leader>dv :call CocAction('jumpDefinition', 'vsplit')<CR>

" Reset go server................
"
nnoremap <leader>ff :setlocal foldmethod=syntax<CR>zR<CR>

" Toggle Fold, move one line above to stay on it
nnoremap <leader>ft zA<CR>k

"Replace word with clipboard
nnoremap <leader>ar "odiWp<CR>

nnoremap <leader>tn :call NewTabAndCmd(':Files')<CR>
