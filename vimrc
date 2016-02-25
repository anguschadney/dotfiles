execute pathogen#infect()
syntax on
filetype plugin indent on
let mapleader = ","

""""""""""""""""""""""""""""""""""""""
" Package list:
"
" Pathogen
"
" ctrlp
" gundo
" nerdcommenter
" syntastic
" vim-airline
" vim-airline-themes
" vim-autoclose
" vim-fugitive
" vim-python-pep8-indent
" YouCompleteMe
"
""""""""""""""""""""""""""""""""""""""

set number
set clipboard+=unnamed
set title

set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set encoding=utf-8

set timeout " Do time out on mappings and others
set timeoutlen=2000 " Wait {num} ms before timing out a mapping

" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
set ttimeoutlen=10
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

let python_highlight_all=1

" Set bracket match colors
hi MatchParen cterm=bold ctermfg=white ctermfg=red

" Airline
set laststatus=2
set t_Co=256
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_flake8_args='--ignore=D100,D101,D102,D103,D400'

" Gundo
nnoremap <F5> :GundoToggle<CR>

" delete current buffer
nnoremap <leader>d :bd<CR>

" save
nnoremap <Leader>w :w<CR>

" save and quit
nnoremap <Leader>q :wq<CR>

" pastetoggle
set pastetoggle=<F2>

