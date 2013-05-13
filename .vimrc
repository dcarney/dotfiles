" ----------------------------------------------------------------------------
" Misc
" ----------------------------------------------------------------------------
syntax enable       " Set syntax highlighting to always on
filetype on         " Set automatic filetype detection to on
set hlsearch        " Show highlighting on search matches
set vb              " set visualbell, to silence the annoying audible bell
colorscheme molokai
set guifont=Inconsolata:h14

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
" Show certain invisible whitespace chars (ala TextMate)
set nolist                 " show whitespace? list/nolist
" set list listchars=tab:».  " show tabs as (Ctrl-K >>)
set ts=2                   " 2 space 'tabs'
set expandtab              " expand tabs to spaces
set nosmarttab             " tabs are dumb

" Highlight trailing whitespace in red:
"   - create color scheme to use to highlight trailing whitespace in red
"   - have this highlighting not appear whilst you are typing in insert mode
"   - have the highlighting of whitespace apply when you open new buffers
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

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
" Key Mappings / Command abbrevs
" ----------------------------------------------------------------------------
" double-backtick activates the scratch.vim plugin in visual and normal modes
nnoremap `` :Sscratch<CR>
vnoremap `` :Sscratch<CR>
map <F2> :NERDTreeToggle<CR>  " NERDTree plugin shortcut

" easier buffer switching
nnoremap <F5> :buffers<CR>:buffer<Space>

" hitting <Ctrl+h> clears last search highlighting
nnoremap <C-h> :nohlsearch<return>

" delete trailing whitespace with :ws
cabbrev ws %s/\s\+$//g

" ----------------------------------------------------------------------------
" Macros
"   NOTE: to enter an <ESC> in the macro, use the ^[ char (CTRL-V ESC), or
"         use \e and double quote the macro
" ----------------------------------------------------------------------------
" comment out a line with '# '
let @c="i# \e0j"

" indent a line with 2 spaces
let @i="i  \e0j"

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
