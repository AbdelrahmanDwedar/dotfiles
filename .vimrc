set number
set tabstop=4
set autoindent
set shiftwidth=4
set mouse=a
set smarttab
set encoding=UTF-8
" set relativenumber

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

plug#begin

Plug 'ryanoasis/vim-devicons'
Plug 'wakatime/vim-wakatime'

plug#end

:so ~/.vimrc
:PlugInstall

set encoding=utf8 

" powerline 
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
