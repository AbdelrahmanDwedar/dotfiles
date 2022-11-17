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
set statusline="%!py3eval('powerline.new_window()')"
set laststatus=2

" -=# Plugins (with vim plug) #=-
call plug#begin()

	Plug 'ryanoasis/vim-devicons' " devicons for vim

	Plug 'wakatime/vim-wakatime' " wakatime watcher
   
	Plug 'tpope/vim-surround' " surrounding blocks with {([ etc... with ys(block)(charachter)

	Plug 'tpope/vim-commentary' " commenting lines with gcc & gc

	Plug 'rafi/awesome-vim-colorschemes' " awesome vim colorschemes

	Plug 'ap/vim-css-color' " css simple color highlightings

	Plug 'godlygeek/tabular' " required for next plugin
	Plug 'preservim/vim-markdown' " MarkDown previewer 

	Plug 'mg979/vim-visual-multi' " visual multi cursoring with <C-n> and others could be found in 

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder for finding files easier

	Plug 'scrooloose/nerdtree' " NERDTree file explorer

	" Plug 'vim-airline/vim-airline' " airline 

	Plug 'solvedbiscuit71/vim-autopair' " auto pairs for {([ etc...

	Plug 'kshenoy/vim-signature'

call plug#end()

" -=# powerline #=-
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

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
nmap <silent> tf :tabfind 

nmap <silent> <Leader>e :NERDTreeToggle<CR>
nmap <silent> <Leader>f :NERDTreeFocus<CR>

nmap <silent> <C-p> :FZF<CR>
nmap <silent> <Leader><Leader>f :FZF<CR>

nmap <silent> <C-c> :VMClear<CR>

nmap <silent> <A-j> :m .+1<CR>==gi
nmap <silent> <A-k> :m .-2<CR>==gi

nmap <silent> <Leader>; A;

nmap <silent> <Down> gj
nmap <silent> <Up> gk

nmap <silent> gV `[v`]

nmap <silent> <Leader><Leader>s :w<CR>:source ~/.vimrc<CR>

" insert mode
imap <silent> <C-p> <Esc>:FZF<CR>

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

