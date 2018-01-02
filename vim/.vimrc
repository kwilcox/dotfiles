call plug#begin('~/.vim/plugged')
" CONTENT

" Declare the list of plugins.
Plug 'airblade/vim-gitgutter'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-obsession'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug '~/.fzf'

" END
call plug#end()

" NERDTree Config
" Open NERDTree when adirectory is opened
set guifont=DroidSansMono\ Nerd\ Font\ 12
set encoding=utf8
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Show hidden files
let NERDTreeShowHidden=1
let g:NERDTreeLimitedSyntax = 1  " Don't lag when scrolling through large directories
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:airline_powerline_fonts=1
