map leader =","
syntax enable  " enable syntax processing
set tabstop=2  " number of spaces per tab
set softtabstop=2  " number of spaces in tab when editing
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent
set showcmd		" show comand in bottom bar
set nocompatible     " be iMproved, required
filetype off      " required
set cursorline	" highlight current line
filetype indent on " load indent files
set wildmenu    " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldenable          " enable folding
set path+=**
let g:closetag_filenames = '*.html,*.vue'
nnoremap <space> :nohlsearch<CR>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap gV `[v`]

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'posva/vim-vue'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

set bg=dark
set go=a
set mouse=a
set ttymouse=sgr
set nohlsearch
set clipboard=unnamedplus

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number
" Enable autocompletion:
	set wildmode=longest,list,full

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <C-b> :NERDTreeToggle<CR>
  map <C-p> :GFiles<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

  " FZF shortcut
  
  colorscheme dracula
  " New configs
  set ttyfast
  set ttimeout
  set ttimeoutlen=50
  set backspace=indent,eol,start
  set showcmd
  set wildmenu
  set wildmode=longest:full,full
  set hidden
  set laststatus=2
  set splitright
  let NERDTreeQuitOnOpen=1
" FZF Configs
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
