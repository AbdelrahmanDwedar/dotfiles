" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝


" -=# Options #=-
set mouse=a
set clipboard = "unnamedplus"
set number
set relativenumber
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent
set encoding=utf8 
set splitbelow splitright
set nohlsearch
set hidden
set wrap

" -=# Plugins (with vim plug) #=-
call plug#begin()

	Plug 'ryanoasis/vim-devicons' 

	Plug 'wakatime/vim-wakatime' 
   
	Plug 'tpope/vim-surround'

	Plug 'tpope/vim-commentary'

	Plug 'rafi/awesome-vim-colorschemes'

	Plug 'ap/vim-css-color'

	Plug 'godlygeek/tabular'
	Plug 'preservim/vim-markdown'

	Plug 'mg979/vim-visual-multi'

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

	Plug 'scrooloose/nerdtree'

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

