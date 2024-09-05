" don't load matchparen
let g:loaded_matchparen = 1

" risky but clean
set nobackup
set noswapfile
set nowritebackup

" highlight search hits
set hlsearch
set incsearch
set linebreak

hi Search ctermbg=236 ctermfg=darkred
hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>
nnoremap <C-R> :source ~/.vimrc<CR>

" Scroll by line in normal and visual mode
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
