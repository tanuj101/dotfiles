syntax on
set number relativenumber
filetype plugin indent on
set mouse=a
set tabstop=4
set shiftwidth=4
set path+=**
set splitbelow
set splitright
set nohlsearch

" Resize split sizes when vim terminal window is resized
autocmd VimResized * wincmd =

" NERDTree config
let g:NERDTreeQuitOnOpen=1
autocmd BufEnter * lcd %:p:h
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

function MyNerdToggle()
    if &filetype == 'nerdtree'
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
    return
endfunction

function! s:GotoOrOpen(command, ...)
  for file in a:000
    if a:command == 'e'
      exec 'e ' . file
    else
      exec "tab drop " . file
    endif
  endfor
endfunction
command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)

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
call plug#end()

" Ale config
let g:ale_linters = {'python':['flake8']}
let g:ale_fixers = {'*':[], 'python': ['black', 'isort'],'javascript':['eslint']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_cpp_clangcheck_options = '-- -Wall -std=c++11 -x c++'
let g:ale_cpp_clangtidy_options = '-Wall -std=c++11 -x c++'



" FZF config
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
let g:fzf_action = {'return': 'vsplit','ctrl-t':'tab split','ctrl-h':'split'}

" Key bindings
nmap <C-b> :call MyNerdToggle()<CR>
nnoremap <C-p> :call GFilesFallback() <CR>
nnoremap <space> :nohlsearch <CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <M-'> :vsplit<CR>
nnoremap <M-/> :split<CR>
nmap <C-Left> <C-w>h
nmap <C-Right> <C-w>l
nmap <C-Down> <C-w>j
nmap <C-Up> <C-w>k
nmap <S-Down> <C-w>-<C-w>-
nmap <S-Up> <C-w>+<C-w>+
nmap <S-Left> <C-w>><C-w>>
nmap <S-Right> <C-w><<C-w><
vmap <C-c> "+y


