execute pathogen#infect()
set background=dark
colorscheme solarized
filetype plugin indent on
syntax enable
let mapleader = ","

""""""""""""""""""""""""""""""""""""""
" Package list:
"
" Pathogen
"
" ctrlp
" csv
" easymotion
" gundo
" jedi
" nerdcommenter
" nerdtree
" python-syntax
" syntastic
" vim-airline
" vim-airline-themes
" vim-autoclose
" vim-devicons
" vim-fugitive
" vim-gitgutter
" vim-javascript
" vim-python-pep8-indent
"
""""""""""""""""""""""""""""""""""""""

set number
set clipboard+=unnamed
set title

set textwidth=0   " Do not break long lines
set wrapmargin=0  " do not wrap lines "
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
let python_version_2=1

" highlight bg at column 80
if v:version >= 703
    set cc=80
end

" Set bracket match colors
hi MatchParen cterm=bold ctermfg=white ctermfg=red

" GitGutter
set updatetime=250

" Airline
set laststatus=2
set noshowmode
set t_Co=256
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Javascript highlighting
let g:javascript_enable_domhtmlcss = 1

" Gundo
nnoremap <F5> :GundoToggle<CR>

" delete current buffer
nnoremap <leader>dd :bd<CR>

" next buffer
nnoremap <Leader>nn :bnext<CR>

" previous buffer
nnoremap <Leader>pp :bprev<CR>

" save
nnoremap <Leader>ww :w<CR>

" save and quit
nnoremap <Leader>qq :wq<CR>

" insert pdb
nnoremap <leader>pdb oimport pdb; pdb.set_trace()<Esc>

" CtrlP buffer and MRU
nnoremap <c-o> :CtrlPBuffer<CR>
nnoremap <c-i> :CtrlPMRU<CR>

" pastetoggle
set pastetoggle=<F2>

" psql formatting
au BufNewFile,BufRead *.pgsql                   setf pgsql
au BufNewFile,BufRead *.psql                    setf pgsql

" CSV
let b:csv_headerline = 1
let g:csv_autocmd_arrange = 1
let g:csv_autocmd_arrange_size = 1024*1024

" NERDTree
autocmd StdinReadPre * let s:std_in=1
map <F6> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree"
let g:WebDevIconsNerdTreeGitPluginForceVAlign=1

" Markdown syntax
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
