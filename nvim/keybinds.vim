
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
xnoremap <silent> ( <ESC>:let p = &paste<CR>:set paste<CR>:let a = line2byte(line('.')) + col('.')<CR>gvc()<ESC>:if getregtype() ==# 'V'<CR>call setreg('"', substitute(@", '\n$', '', ''), 'c')<CR>endif<CR>P:exe "goto ".a<CR>:exe "let &paste=".p<CR> :imap kj <Esc>
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)

nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <leader>ta :Tags<CR>

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

nmap <silent> <leader>fw :w!<CR>
nmap <silent> <leader>, A;
nmap <silent> <leader>fq :q!<CR>
nmap <silent> <leader>cd :cd /home/davidv7/
nmap <silent> <leader>fb :Files<CR>
nmap <leader>tt :!setxkbmap -option caps:escape<CR>
nmap <leader>ll :!ls %:p<CR>

nnoremap <leader>cc :!cd %:p:h<CR>:pwd<CR>
nnoremap <leader>cf :Files %:p:h<CR>

nmap <leader>m :Marks<CR>
nmap <leader>to :TagbarToggle<CR>
nmap <leader>ts :TagbarShowTag<CR>


inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" End a line with a semicolon
nnoremap ; <Esc>A;
    " 'quote' a word
nnoremap qsw :silent! normal mpea'<Esc>bi'<Esc>`pl

" double "quote" a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl

nnoremap qw :silent! normal mpEa"<Esc>Bi"<Esc>`pl

" remove quotes from a word
nnoremap wq :silent! normal mpeld bhd `ph<CR>
nnoremap ql :silent! normal mpEA"<Esc>bi"<Esc>`pl



nnoremap <A-r>  :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>pp :MarkdownPreview<CR>
nnoremap <A-n>


