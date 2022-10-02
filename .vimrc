set number
set tabstop=4
set autoindent
set shiftwidth=4
set mouse=a
set smarttab
set encoding=utf8 
set relativenumber

plug#begin

Plug 'ryanoasis/vim-devicons'
Plug 'wakatime/vim-wakatime'

plug#end

" powerline 
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
