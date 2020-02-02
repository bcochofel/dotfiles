" auto install vim-plug, plugin manager
" detects if running neovim
" Neovim uses ~/.config/nvim/init.vim, not ~/.vimrc
if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin('~/.vim/plugged')

" Theme
Plug 'lifepillar/vim-solarized8'
Plug 'arcticicestudio/nord-vim'
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Utilities
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ervandew/supertab'

call plug#end()

" Color theme {{{
colorscheme solarized8_high
"colorscheme nord
set background=dark " dark background

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Hey, I do not get the right colors when running Vim inside tmux
" or in my favourite true-color enabled terminal!
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" }}}

" Basics and Features {{{

" When on, uses highlight-guifg and highlight-guibg attributes in
" the terminal (thus using 24-bit color).
if (has("termguicolors"))
  set termguicolors
endif

filetype plugin indent on " add filetype, plugin, and indent support

syntax on " turn on syntax highlighting

set hlsearch  " highlight searches

set smartcase " case-sensitive if search contains an uppercase character

set number relativenumber " turn relative line numbers on

set colorcolumn=80,120 " add vertical lines on columns

set cursorline " highligh current line

set shiftwidth=2 " indent is 4 spaces (should be same as softtabstop for consistency)
set softtabstop=2 " number of spaces inserted when inputting tab
set expandtab " don't use actual tab character (use spaces instead)

set hidden " allow switching buffers without writing to disk

set noswapfile " no swap files

set path=.,** " search relative to current file + directory

set confirm " instead raise a dialogue asking if you wish to save changed files.

set wildmenu " better command-line completion

set wildmode=list:longest,full " set command-line completion mode

set showcmd " show partial commands in the last line of the screen

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

set shell=/usr/bin/zsh " prefer zsh for shell-related tasks

" }}}

" Plugin Configurations {{{

" ----- NerdCommenter -----
" :help nerdcommenter
"
" [count]<leader>c<space> |NERDCommenterToggle| 
" Toggles the comment state of the selected line(s). If the topmost selected 
" line is commented, all selected lines are uncommented and vice versa.

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" ----- NERDTree -----
" :help NERDTreeMappings
" t: Open the selected file in a new tab
" i: Open the selected file in a horizontal split window
" s: Open the selected file in a vertical split window
" I: Toggle hidden files
" m: Show the NERD Tree menu
" R: Refresh the tree, useful if files change outside of Vim
" ?: Toggle NERD Tree's quick help

map <F6> : NERDTreeToggle<CR>

" ----- TagBar -----
" :help tagbar

map <F8> : TagbarToggle<CR>

" ----- Indent Guides -----
" :help indent-guides

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1

" ----- Super TAB -----
" :help supertab
" }}}

" Mapping {{{

" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC<CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :e $MYVIMRC<CR>

" <Leader> is \ by default, so those commands can be invoked by doing \v and \s
" }}}
