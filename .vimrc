" auo o install vim-plug, plugin manager
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
" Plug 'arcticicestudio/nord-vim'
" Status bar
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Utilities
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

" ---------
" Terraform
" ---------
Plug 'hashivim/vim-terraform'

" -------
" Ansible
" -------
Plug 'pearofducks/ansible-vim'

" ----
" TMux
" ----
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Color theme {{{
let g:solarized_termcolors=256
colorscheme solarized8_high
" colorscheme nord
set background=dark " dark background

" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'

let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ }

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

if !has('gui_running')
  set t_Co=256 " max number of colors that can be displayed by the terminal
endif

filetype plugin indent on " add filetype, plugin, and indent support

syntax on " turn on syntax highlighting

set hlsearch  " highlight searches

set smartcase " case-sensitive if search contains an uppercase character

set number relativenumber " turn relative line numbers on

set colorcolumn=80,120 " add vertical lines on columns

set cursorline " highligh current line

set laststatus=2 " to display the status line always

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

" ----- FZF: Fuzzy Finder -----
" :Files
" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" ----- Ack -----

" use silver searcher if available
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Usage
" :Ack [options] {pattern} [{directories}]
" Search recursively in {directories} (which defaults to the current directory) for the {pattern}.
" Files containing the search term will be listed in the quickfix window, along with the line number of the occurrence, once for each occurrence. <Enter> on a line in this window will open the file and place the cursor on the matching line.
" Just like where you use :grep, :grepadd, :lgrep, and :lgrepadd, you can use :Ack, :AckAdd, :LAck, and :LAckAdd respectively. (See :help Ack after installing, or doc/ack.txt in the repo, for more information.)
" For more ack help see ack documentation.
"
" Keyboard Shortcuts

" The quickfix results window is augmented with these convenience mappings:

" ?    a quick summary of these keys, repeat to close
" o    to open (same as Enter)
" O    to open and close the quickfix window
" go   to preview file, open but maintain focus on ack.vim results
" t    to open in new tab
" T    to open in new tab without moving to it
" h    to open in horizontal split
" H    to open in horizontal split, keeping focus on the results
" v    to open in vertical split
" gv   to open in vertical split, keeping focus on the results
" q    to close the quickfix window

" ----- vim-terraform -----
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1

" HCL
augroup filetypedetect
  au! BufRead,BufNewFile *.hcl setf terraform
augroup END

" ----- vim-ansible -----

let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ob"
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
"
" useful settings:
" Typing ":set xxx" sets the option "xxx".  Some options are:
"    'ic' 'ignorecase'       ignore upper/lower case when searching
"    'is' 'incsearch'        show partial matches for a search phrase
"    'hls' 'hlsearch'        highlight all matching phrases
"    You can either use the long or the short option name.
"
"    Prepend "no" to switch an option off:   :set noic

" }}}
