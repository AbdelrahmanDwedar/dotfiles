" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝


" -=# Options #=-
set number
set tabstop=4
set autoindent
set shiftwidth=4
set mouse=a
set smarttab
set encoding=utf8 
set relativenumber

" -=# Plugins (with vim plug) #=-
call plug#begin()

  	Plug 'ryanoasis/vim-devicons' 

  	Plug 'wakatime/vim-wakatime' 
   
  	Plug 'tpope/vim-surround'

  	Plug 'tpope/vim-commentary'

  	Plug 'rafi/awesome-vim-colorschemes'

  	Plug 'ap/vim-css-color'

  	Plug 'preservim/nerdtree'

	Plug 'godlygeek/tabular'
	Plug 'preservim/vim-markdown'

	Plug 'mg979/vim-visual-multi'

call plug#end()

" -=# powerline #=-
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" -=# colorscheme #=-
colorscheme rdark-terminal2

" -=# key bindings #=-
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

map <C-z> :NerdTreeToggle<CR>
map <C-f> :NerdTreeFocus<CR>

map <C-c> :VMClear<CR>

" -=# Cursor #=-
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
let &t_SR = "\e[4 q"

