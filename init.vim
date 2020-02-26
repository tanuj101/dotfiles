" Basic config
syntax on
set nu
filetype plugin indent on
set mouse=a
set tabstop=4
set shiftwidth=4
set path+=**

" netrw config
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=3


" coc.nvim Configs
set expandtab
set cmdheight=2
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Plugins
call plug#begin()
Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdtree'
Plug 'w0rp/ale' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Ale
let g:ale_linters = {'python':['flake8']}
let g:ale_fixers = {'*':[], 'python': ['black', 'isort'],'javascript':['eslint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" Functions
function GFilesFallback()
  let output = system('git rev-parse --show-toplevel') " Is there a faster way?
  let prefix = get(g:, 'fzf_command_prefix', '')
  if v:shell_error == 0
    exec "normal :" . prefix . "GFiles\<CR>"
  else
    exec "normal :" . prefix . "Files\<CR>"
  endif
  return 0
endfunction

" Key bindings
nnoremap <C-b> :NERDTreeToggle <CR>
nnoremap <C-p> :call GFilesFallback() <CR>
nnoremap <space> :nohlsearch <CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

