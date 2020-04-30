
call plug#begin('~/.local/share/nvim/plugged')

    Plug 'airblade/vim-gitgutter'

    "Plug 'zxqfl/tabnine-vim'

    "Plug 'itspriddle/vim-shellcheck'

    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    "Plug 'fneu/breezy'
    "Plug 'joshdick/onedark.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'itchyny/lightline.vim'

    Plug 'kshenoy/vim-signature'
    "Plug 'majutsushi/tagbar'


"    Plug 'vim-syntastic/syntastic'
    Plug 'thaerkh/vim-indentguides'
    Plug 'frazrepo/vim-rainbow'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    Plug 'lervag/vimtex'
    Plug 'norcalli/nvim-colorizer.lua'
"    Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}
"
"Plug 'mhinz/vim-startify'
	Plug 'tmsvg/pear-tree'
	Plug 'tveskag/nvim-blame-line'
	Plug 'bagrat/vim-buffet'
call plug#end()


let mapleader = " "
let maplocalleader = " "
source $HOME/.config/nvim/universal.vim
source $HOME/.config/nvim/keybinds.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/tabs.vim
source $HOME/.config/nvim/cocdefaults.vim
source $HOME/.config/nvim/colorscheme.vim
"source $HOME/.config/nvim/tagbar.vim
"source $HOME/.config/nvim/syntastic.vim

"lua vim.api.nvim_command [[autocmd CursorHold   * lua require'utils'.blameVirtText()]]
"lua vim.api.nvim_command [[autocmd CursorMoved  * lua require'utils'.clearBlameVirtText()]]
"lua vim.api.nvim_command [[autocmd CursorMovedI * lua require'utils'.clearBlameVirtText()]]
"
"
"
