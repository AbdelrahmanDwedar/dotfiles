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

	Plug 'rafi/awesome-vim-colorschemes' " awesome vim colorschemes

	Plug 'wakatime/vim-wakatime' " wakatime watcher

call plug#end()

" -=# colorscheme #=-
colorscheme nord

" -=# key bindings #=-
nnoremap <SPACE> <Nop>
let mapleader=" "

nmap <silent> <C-l> <C-w>l
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-k>k

nmap <silent> <C-CR> <Esc>o
nmap <silent> B ^
" nmap <silent> E $

nmap <silent> <C-Left> :vertical resize +3<CR>
nmap <silent> <C-Right> :vertical resize -3<CR>
nmap <silent> <C-Up> :resize +3<CR>
nmap <silent> <C-Down> :resize -3<CR>

nmap <silent> rt :tabclose<CR>
nmap tf :tabfind 

nmap <silent> <A-j> :m .+1<CR>==
nmap <silent> <A-k> :m .-2<CR>==

nmap <silent> <Leader>; A;

nmap <silent> <Down> gj
nmap <silent> <Up> gk

nmap <silent> gV `[v`]

nmap <silent> <Leader><Leader>s :w<CR>:source ~/.vimrc<CR>

" insert mode
imap <C-BS> <C-W>
imap <C-CR> <Esc>o

" visual mode
vmap <silent> > >gv
vmap <silent> < <gv

vmap <silent> <A-j> :m .+1<CR>=="
vmap <silent> <A-k> :m .-2<CR>=="

" visual block mode
xmap <silent> <A-j> :move '>+1<CR>gv-gv
xmap <silent> <A-k> :move '<-2<CR>gv-gv

" -=# Cursor #=-
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
let &t_SR = "\e[4 q"

