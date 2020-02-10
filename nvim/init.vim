call plug#begin('~/.local/share/nvim/plugged')

    Plug 'airblade/vim-gitgutter'

    "Plug 'zxqfl/tabnine-vim'

    "Plug 'itspriddle/vim-shellcheck'

    "Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    "Plug 'fneu/breezy'

    Plug 'joshdick/onedark.vim'

    Plug 'itchyny/lightline.vim'

    Plug 'kshenoy/vim-signature'
    "Plug 'majutsushi/tagbar'

    Plug 'vim-syntastic/syntastic'
    "Plug 'yggdroot/indentline'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    Plug 'lervag/vimtex'

call plug#end()


source $HOME/.config/nvim/keybinds.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/tabs.vim
source $HOME/.config/nvim/cocdefaults.vim
source $HOME/.config/nvim/universal.vim
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/tagbar.vim
source $HOME/.config/nvim/syntastic.vim
