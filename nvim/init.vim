call plug#begin('~/.local/share/nvim/plugged')

    Plug 'airblade/vim-gitgutter'

    "Plug 'zxqfl/tabnine-vim'

    Plug 'itspriddle/vim-shellcheck'

    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'fneu/breezy'

    Plug 'joshdick/onedark.vim'

    Plug 'itchyny/lightline.vim'

call plug#end()



source $HOME/.config/nvim/keybinds.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/tabs.vim
source $HOME/.config/nvim/cocdefaults.vim
source $HOME/.config/nvim/universal.vim
