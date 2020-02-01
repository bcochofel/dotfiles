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

set shell=/usr/bin/zsh " Prefer zsh for shell-related tasks

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

" }}}
