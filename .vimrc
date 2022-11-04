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
nnoremap <SPACE> <Nop>
let mapleader=" "

nmap <silent> <C-l> <C-w>l
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-k>k

nmap <silent> <C-CR> <Esc>o
nmap <silent> B ^
nmap <silent> E $

nmap <silent> <C-Left> :vertical resize +3<CR>
nmap <silent> <C-Right> :vertical resize -3<CR>
nmap <silent> <C-Up> :resize +3<CR>
nmap <silent> <C-Down> :resize -3<CR>

nmap <silent> rt :tabclose<CR>
nmap <silent> tf :tabfind 

nmap <silent> <Leader>e :NERDTreeToggle<CR>
nmap <silent> <Leader>f :NERDTreeFocus<CR>

nmap <silent> <C-p> :FZF<CR>

nmap <silent> <C-c> :VMClear<CR>

nmap <silent> <A-j> :m .+1<CR>==gi
nmap <silent> <A-k> :m .-2<CR>==gi

nmap <silent> <Leader>; A;

nmap <silent> <Down> gj
nmap <silent> <Up> gk

nmap <silent> gV `[v`]

" insert mode
imap <silent> <C-p> <Esc>:FZF<CR>

imap <C-BS> <C-W>
imap <C-CR> <Esc>o

" visual mode
vmap > >gv
vmap < <gv

vmap <silent> <A-j> :m .+1<CR>=="
vmap <silent> <A-k> :m .-2<CR>=="

" visual block mode
xmap <silent> <A-j> :move '>+1<CR>gv-gv
xmap <silent> <A-k> :move '<-2<CR>gv-gv

" -=# Cursor #=-
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
let &t_SR = "\e[4 q"

