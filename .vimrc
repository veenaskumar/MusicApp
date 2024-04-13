"Basic Configurations -------------------------------------{{{
"Set line number
set relativenumber
" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Turn syntax highlighting on.
syntax on
" Automatically wrap text
set wrap
" set the status bar
set laststatus=2
" Set wildmenu to show the files in the folder
set wildmenu
" set filetype indent
filetype indent on
" set vim spliting as right and below
set splitbelow splitright
" Nerdtree configi
" automatically nerd tree open
"autocmd Vimenter * NERDTree
" automatically nerd tree close
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

packloadall
"}}}


"Mappings----------------------------------------------------------- {{{
" Set vim split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Resizng split height and width
nnoremap <silent> <C-Left> :vertical resize+3<CR>
nnoremap <silent> <C-Right> :vertical resize-3<CR>
nnoremap <silent> <C-Up> :resize+3<CR>
nnoremap <silent> <C-Down> :resize-3<CR>
" Setting up Nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>

" Setting up tagbar
nnoremap <F2> :TagbarToggle<CR>
"nmap <F8> :TagbarToggle<CR>

"Key Mappings for html emmet
"Creating html template
let g:user_emmet_leader_key=','

"""}}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"One dark scripts
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
"colorscheme onedark
colorscheme night-owl

"for tab completion in coc
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" }}}


" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')
 Plug 'preservim/nerdtree'
" Plug 'joshdick/onedark.vim'
 " tagbar
 Plug 'preservim/tagbar'
"Add coc
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
"auto pairs
 Plug 'jiangmiao/auto-pairs'

 " For Emmet
 Plug 'mattn/emmet-vim'

 "Night owl colorscheme
 Plug 'haishanh/night-owl.vim'

 "Plugin for dev icons
 Plug 'ryanoasis/vim-devicons'

 "Plugin for clost tags
 Plug 'alvan/vim-closetag'

 "Plug in for code format
"Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' } 
 
 call plug#end()


" }}}


"STATUS LINE -------------------------------------------------------------- {{{

 " Status line left side.
  set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
  set statusline+=%=

 " Status line right side.
  set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

"}}}
