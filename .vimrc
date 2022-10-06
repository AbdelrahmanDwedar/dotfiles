set number
set tabstop=4
set autoindent
set shiftwidth=4
set mouse=a
set smarttab
set encoding=utf8 
set relativenumber

" Plugins (with vim plug)
call plug#begin()

  Plug 'ryanoasis/vim-devicons' 

  Plug 'wakatime/vim-wakatime' 
   
  Plug 'tpope/vim-surround'

  Plug 'tpope/vim-commentary'

  Plug 'rafi/awesome-vim-colorschemes'

  Plug 'ap/vim-css-color'

call plug#end()

" powerline 
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" set colorscheme to rdark-terminal2
colorscheme rdark-terminal2

" key bindings
map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-k>k

map <C-Enter> <Esc>o
map B ^
map E $

map <C-Left> :vertical resize +3<CR>
map <C-Right> :vertical resize -3<CR>
map <C-Up> :resize +3<CR>
map <C-Down> :resize -3<CR>

map rt :tabclose<CR>
map tf :tabfind 


