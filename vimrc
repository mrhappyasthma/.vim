" This is the vimrc file for use across all computers I use.
" Changes specific to a specific computer should go in ~/.vimrc.
" Changes specific to NeoVim should go in ~/.vim/init.vim
set nocompatible

" Used throughout to source platform specific
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""
" Set up Vundle
"""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'gabesoft/vim-ags'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/Parameter-Text-Objects'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/abolish.vim'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'vim-scripts/mru.vim'
Bundle 'vim-scripts/surround.vim'
Bundle 'vim-scripts/tComment'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'

call SourceIfExists('~/.vimlocal/bundles')

filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""
" Basic Options
"""""""""""""""""""""""""""""""""""""""""""""

" Sets the titlebar of the terminal to be the name of the file
set title

" Hides buffers rather than closing them when opening a new buffer
set hidden

"Don't redraw while executing macros
set nolazyredraw

" for regular expressions
set magic

" Increases the command history
set history=1000

" Forces lines to not wrap
set nowrap

" Does not make a sound when there is an error
set noerrorbells

" Backspace config
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Show the line and column number of the cursor
set ruler

" ensures the cursor never reaches the bottom of the window
set scrolloff=2

" Tab settings
set tabstop=2 " Tabs are 2 spaces
set shiftwidth=2 " Tab characters are 2 spaces
set softtabstop=2 " Soft tabs are 2 spaces
set expandtab " Tab key creates spaces instead of tabs
set autoindent
set smartindent " Intelligently guess the indentation level of the next line
set smarttab " Indenting is done intelligently, as well as backspacing through indents

" Searching options
set incsearch " Incremental search (begin searching as soon as you star typing)
set ignorecase " Ignore the case when searching strings
set smartcase " Ignore the ignorecase option if search pattern contains uppcase letters

" Shows number along the left side
set number

" Opens moves to the existing buffer instead of reopening it
set switchbuf=useopen,usetab

" Decide folds using indentation
" set foldmethod=syntax
set foldmethod=indent
set foldenable
set foldlevel=1000

" turn on syntax highlighting
syntax on

" Turns on autodetection of filetypes
filetype on

" Loads the plugins for specific filetypes
filetype plugin on

" sets GNU grep to be the program to run when searching
set grepprg=grep\ -rnH\ $*

" what the mouse pointer looks like in different modes
set mouse=a
set mouses=i-r:beam,s:updown,sd:udsizing,vs:leftright,vd:lrsizing,m:no,ml:up-arrow,v:rightup-arrow

" Remove menu bar
set guioptions=rLte

" Make the dividers look nicer
set fillchars+=vert:│

set hlsearch

" Reload files if they've changed so we don't operate on stale data.
set autoread

"""""""""""""""""""""""""""""""""""""""""""""

"Highlight text over 80 chars in green
highlight EightyChars ctermbg=green ctermfg=white guibg=#592929
call matchadd('EightyChars', '\%81v.\+')

"Highlight text over 100 chars in light blue
highlight OneHundredChars ctermbg=lightblue ctermfg=white guibg=#592929
call matchadd('OneHundredChars', '\%101v.\+')

"Highlight trailing whitespace in red
highlight TrailingWhiteSpace ctermbg=red guibg=red
call matchadd('TrailingWhiteSpace', '\s\+$')

"Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"Wrap arguments when using '==' from the command menu
set cino=(0

""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
"""""""""""""""""""""""""""""""""""""""""""""

" Fast editing of the .vimrc
nnoremap <leader>v :tabe! $MYVIMRC<CR>
nnoremap <leader>cw :botright cwindow<CR>

" Settings for dealing with buffers
nnoremap <C-left> <C-w>h
nnoremap <C-down> <C-w>j
nnoremap <C-up> <C-w>k
nnoremap <C-right> <C-w>l

" Make yank not stupid
map Y y$

" Cutting and pasting
vmap <C-c> "+y
vmap <C-x> "+d
imap <C-v> <esc>"+pa

" I hit shift k a lot when I mean to just hit k, for some reason
map <S-k> k

nnoremap <silent> <f12> :!ctags -R *<CR>

nnoremap <space> za

" Quick save and loading of sessions
nnoremap <F7> :mksession! ./.vim_session<cr>
nnoremap <F8> :source ./.vim_session<cr>

nnoremap ! :!
nnoremap q: :q

vnoremap <C-h> y:call Preserve("%s/<C-r>"//g")<left><left><left><left>
vnoremap <C-f> y:grep <C-r>" %:p:h

nnoremap j gj
nnoremap k gk

nnoremap Q gqap

cmap <C-V> <C-R>+

"""""""""""""""""""""""""""""""""""""""""""""
" Other neat stuff
"""""""""""""""""""""""""""""""""""""""""""""

" When vimrc is edited, reload it
autocmd! bufwritepost $HOME/.vimrc source $MYVIMRC
autocmd! bufwritepost $HOME/.vim/init.vim source $MYVIMRC
autocmd! bufwritepost $HOME/.vim/vimrc source $MYVIMRC
autocmd! bufwritepost $VIM/vimfiles/vimrc source $MYVIMRC

" Display matches of last search in window
nnoremap <silent> <leader>g :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" files that can not be written should not be modifiable
au BufNew,BufAdd,BufWrite,BufNewFile,BufRead,BufEnter,FilechangedRO * : if &ro | set nomodifiable | endif
au BufNew,BufAdd,BufWrite,BufNewFile,BufRead,BufEnter,FilechangedRO * : if !&ro | set modifiable | endif

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,longest

function! Preserve(command)
    let w = winsaveview()
    execute a:command
    call winrestview(w)
endfunction

" nnoremap <silent> <leader>= :call Preserve("FormatCode")<CR>
nnoremap <silent> <leader><space> :call Preserve("%s/\\s\\+$//e")<CR>

" replace selected text with text in paste register, without overwriting the
" text in the yank register with the text replaced.
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction
function! PasteOver()
     let s:restore_reg = @"
     return "p@=RestoreRegister()\<cr>"
endfunction
vnoremap <silent> <expr> p PasteOver()

" Format on save
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

"""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""

""" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" MRU
let MRU_Max_Entries = 500
nnoremap <leader>m :MRU<CR>

""" TComment
nnoremap g/ :TComment<CR>
vnoremap g/ :TComment<CR>

""" Bufexplorer
" Do not show default help.
let g:bufExplorerDefaultHelp=0
" Sort by full file path name.
let g:bufExplorerSortBy='name'
nnoremap <C-b> :BufExplorer<cr>

""" NERDTree
nnoremap <f2> :NERDTreeToggle<CR>
nnoremap <f3> :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=48

""" alternate
let g:alternateExtensions_h = "cc,cpp,cxx,c,mm,m"
let g:alternateExtensions_mm = "h"

""" CtrlP
" Ignore the following files in ctrl-P
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v(\.(git|hg|svn)|bin|obj|tmp|CMakeFiles)$',
"   \ 'file': '\v((\.(exe|so|dll|bin|o|a|o.d|make|cbp))|CMakeCache.txt)$',
"   \ }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore bin
      \ --ignore obj
      \ --ignore tmp
      \ --ignore CMakeFiles
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore .git5_specs
      \ --ignore review
      \ -g ""'
let g:ctrlp_root_markers = ['METADATA']
nnoremap <C-P> :CtrlPMRUFiles<CR>

""" Tabularize
vmap <S-T> :Tab/\|<CR>
