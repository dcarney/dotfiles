" ----------------------------------------------------------------------------
" Misc
" ----------------------------------------------------------------------------
syntax enable       " Set syntax highlighting to always on
filetype on         " Set automatic filetype detection to on
set hlsearch        " Show highlighting on search matches
set vb              " set visualbell, to silence the annoying audible bell
colorscheme molokai
set fileencodings=utf-8
set encoding=utf-8

" ----------------------------------------------------------------------------
"  Text Formatting
" ----------------------------------------------------------------------------
" Show certain invisible whitespace chars (ala TextMate)
set nolist                 " show whitespace? list/nolist
" set list listchars=tab:».  " show tabs as (Ctrl-K >>)
set ts=2                   " 2 space 'tabs'
set shiftwidth=2           " 2 space indentations
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
" if exists('+colorcolumn')
"   set colorcolumn=100     " Show colorcolumn at 100 chars
"   hi ColorColumn ctermbg=darkgrey guibg=DimGray
" endif

" ----------------------------------------------------------------------------
" Plugin configs
" ----------------------------------------------------------------------------
" double-backtick activates the scratch.vim plugin in visual and normal modes
nnoremap `` :Sscratch<CR>
vnoremap `` :Sscratch<CR>
map <F2> :NERDTreeToggle<CR>  " NERDTree plugin shortcut
nmap <F8> :TagbarToggle<CR>   " Tagbar plugin shortcut

" show hidden files by default
let NERDTreeShowHidden=1

" ctrlp plugin config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" 'c' - the directory of the current file.
" " 'r' - the nearest ancestor that contains one of these directories or
" files: .git .hg .svn .bzr _darcs
" " 'a' - like c, but only if the current working directory outside of CtrlP
" is not a direct ancestor of the directory of the current file.
" " 0 or '' (empty string) - disable this feature.
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_root_markers = ['src']

" enable markdown highlighting
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" don't snow the scratch preview window for autocompletion
set completeopt-=preview

" ----------------------------------------------------------------------------
" key mappings / command abbrevs / custom functions
" ----------------------------------------------------------------------------
" easier buffer switching
nnoremap <F5> :buffers<CR>:buffer<Space>

" hitting <Ctrl+h> clears last search highlighting
nnoremap <C-h> :nohlsearch<return>

let mapleader = "\<Space>"

" save buffer
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>

" enter visual mode
nmap <Leader><Leader> V

" yank/paste to system clipboard (assuming your vim supports it)
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" "replace" current selection with register
"   vmap - mapping for visual mode
"   _d - delete current selection into "black hole register"
"   P - paste
vmap r "_dP

" delete trailing whitespace with :ws
cabbrev ws %s/\s\+$//g


" :GG to run a `git grep` on the current working tree
" "silent" makes the cmd bypass the shell's "Hit ENTER to continue" prompt
" "cw" opens the results in the quickfix window
func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=? GG silent call GitGrep(<f-args>) | cw

" let :gg do the same thing as the above
cabbrev gg GG

" ----------------------------------------------------------------------------
"  move between panes using vim movement (Ctrl + j, etc.)
" ----------------------------------------------------------------------------
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ----------------------------------------------------------------------------
" split windows using Ctrl+W then '-' or '|', to mirror my tmux bindings
" ----------------------------------------------------------------------------
nnoremap <C-W>\| :vsplit<Enter>
nnoremap <C-W>_ :split<Enter>

" ----------------------------------------------------------------------------
" disable the arrow keys (stop using them as a crutch!)
" ----------------------------------------------------------------------------
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" imap <up> <NOP>
" imap <down> <NOP>
" imap <left> <NOP>
" imap <right> <NOP>

" ----------------------------------------------------------------------------
"  golang configs
" ----------------------------------------------------------------------------
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gdb <Plug>(go-doc-browser)
au FileType go nmap <Leader>gdv <Plug>(go-doc-vertical)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <Leader>e <Plug>(go-rename)
cabbrev def GoDef

let $GOPATH = "/home/dcarney/go"
let $GOROOT = "/usr/local/go"

" let goimports handle inserting import paths
let g:go_fmt_command = "goimports"

" ctrlp plugin default mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ----------------------------------------------------------------------------
"  javascript configs
" ----------------------------------------------------------------------------
" user 4-space indents for javascript files
autocmd FileType javascript setlocal shiftwidth=4 softtabstop=4

" :set conceallevel=2 to replace "function" with "ƒ", etc.
let g:javascript_conceal_function = "ƒ"

" ----------------------------------------------------------------------------
" Macros
"   NOTE: to enter an <ESC> in the macro, use the ^[ char (CTRL-V ESC), or
"         use \e and double quote the macro
" ----------------------------------------------------------------------------
" comment out a line with '# '
let @h="i# \e0j"

" comment out a line with '// '
let @c="i// \e0j"

" indent a line with 2 spaces
let @i="i  \e0j"

" ----------------------------------------------------------------------------
" Vundle config
" ----------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required!)
Plugin'gmarik/Vundle.vim'
Plugin 'git://github.com/Lokaltog/vim-powerline.git'
Plugin 'git://github.com/mkitt/tabline.vim.git'
Plugin 'git://github.com/fatih/vim-go.git'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree.git'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
call vundle#end()

" indent by filetype - required!
filetype plugin indent on

