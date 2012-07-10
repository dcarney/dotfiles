colorscheme molokai
set guifont=Inconsolata:h14

" Show certain invisible whitespace chars (ala TextMate)
set list
set listchars=tab:▸\ ,eol:¬

" Set syntax highlighting to always on
syntax enable

" Set automatic filetype detection to on
filetype on

" ----------------------------------------------------------------------------
"  MacVim
" ----------------------------------------------------------------------------
" Remove all the UI toolbars
set go-=T
set go-=l
set go-=L
set go-=r
set go-=R

" ----------------------------------------------------------------------------
"  Text Formatting
" ----------------------------------------------------------------------------
set ts=2                   " 2 space 'tabs'
set expandtab              " expand tabs to spaces
set nosmarttab             " tabs are dumb

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------
" Set items for view @ bottom of windows
set ruler                   " Show the cursor position all the time
set showmode                " Display current mode
set number                  " Show row numbers on the left side
set ls=2                    " Always show status bar

" only exists in vim >= 7.3
if exists('+colorcolumn')
  set colorcolumn=80                   " Show colorcolumn at 80 chars
  hi ColorColumn ctermbg=darkgrey guibg=DimGray
endif

" ----------------------------------------------------------------------------
"  NERDTree plugin
" ----------------------------------------------------------------------------
" shorter than typing :NERDTree and :NERDTreeClose
map <F2> :NERDTreeToggle<CR>

" ----------------------------------------------------------------------------
" Vundle config
" ----------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required!) 
Bundle 'gmarik/vundle' 

Bundle 'git://github.com/Lokaltog/vim-powerline.git'
filetype plugin indent on  " required!  
