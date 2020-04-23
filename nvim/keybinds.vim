
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
xnoremap <silent> ( <ESC>:let p = &paste<CR>:set paste<CR>:let a = line2byte(line('.')) + col('.')<CR>gvc()<ESC>:if getregtype() ==# 'V'<CR>call setreg('"', substitute(@", '\n$', '', ''), 'c')<CR>endif<CR>P:exe "goto ".a<CR>:exe "let &paste=".p<CR> :imap kj <Esc>
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
inoremap <silent> <C-b> <Plug>(coc-definition)
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <leader>gi :!goimports -w %<CR>
map <C-a> <esc>ggVG<CR>
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
nnoremap <leader>pa :silent! normal Ea)<ESc>Bi( " unsurround word, works on anything on left and right side of Word
nnoremap <leader>us normal EdlBdh
nnoremap , `
" remove quotes from a word
"nnoremap wq :silent! normal mpeld bhd `ph<CR>
nnoremap ql :silent! normal mpEA"<Esc>bi"<Esc>`pl



nnoremap <A-r> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>pp :MarkdownPreview<CR>
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

nnoremap <leader>gb :ToggleBlameLine
nnoremap <leader>cal :pu=strftime('%c')

