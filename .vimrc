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

call plug#begin()
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
call plug#end()

"autocmd FileType go set signcolumn=yes

let g:lsp_completion_documentation_enabled = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
set backspace=indent,eol,start

set paste
set omnifunc=lsp#complete
"set signcolumn=yes
highlight clear SignColumn
