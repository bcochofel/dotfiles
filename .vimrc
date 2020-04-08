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

if empty(glob('~/go'))
  autocmd VimEnter * GoInstallBinaries --sync
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
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
" Plug 'liuchengxu/vista.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Check syntax
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'

" GIT
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'

" ---------
" Terraform
" ---------
Plug 'hashivim/vim-terraform'

" -------
" Ansible
" -------
Plug 'pearofducks/ansible-vim'

" --
" Go
" --
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" ----
" TMux
" ----
Plug 'christoomey/vim-tmux-navigator'

" ---------------
" Code completion
" ---------------
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }
" do not forget to install jedi
Plug 'deoplete-plugins/deoplete-jedi'

call plug#end()

let g:deoplete#enable_at_startup = 1

" Color theme {{{
let g:solarized_termcolors=256
colorscheme solarized8_high
" colorscheme nord
set background=dark " dark background

" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'

let g:lightline = {
     \ 'colorscheme': 'solarized',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'gitbranch'], 
       \             [ 'readonly', 'absolutepath', 'modified' ] ],
       \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
       \              [ 'lineinfo', 'percent' ],
       \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
       \ },
       \ 'component_function': {
       \   'gitbranch': 'gitbranch#name',
       \ },
      \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}

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

set backspace=indent,eol,start

set smartcase " case-sensitive if search contains an uppercase character

set number relativenumber " turn relative line numbers on

set colorcolumn=80,120 " add vertical lines on columns

set cursorline " highligh current line

set laststatus=2 " to display the status line always

set shiftwidth=2 " indent is 2 spaces (should be same as softtabstop for consistency)
set softtabstop=2 " number of spaces inserted when inputting tab
set expandtab " don't use actual tab character (use spaces instead)

set hidden " allow switching buffers without writing to disk

set noswapfile " no swap files

set path=.,** " search relative to current file + directory

set confirm " instead raise a dialogue asking if you wish to save changed files.

set wildmenu " better command-line completion

set wildmode=list:longest,full " set command-line completion mode

set autoindent " auto indentation

" Completion options (select longest + show menu even if a single match is
" found)
set completeopt=longest,menuone

" Enable folding
set foldmethod=indent
set foldlevel=99

set showcmd " show partial commands in the last line of the screen

set encoding=utf-8 " set default enconding

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" Python tabs and spaces
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set fileformat=unix

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
let g:python_host_prog  = '/usr/bin/python2'
" Skip the check of neovim module
let g:python3_host_skip_check = 0"

" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.md set spell
au BufNewFile,BufRead *.md set textwidth=80

set shell=/usr/bin/zsh " prefer zsh for shell-related tasks

" }}}

" Plugin Configurations {{{

" ----- UltiSnips -----
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ----- Gutentags -----
let g:gutentags_cache_dir = expand('~/.vim/gutentags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" ----- ALE -----
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \   'yaml.ansible': ['ansible-lint'],
      \   'yaml' : ['yamllint'],
      \}
let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
nmap <F9> :ALENext<CR>
nmap <F8> :ALEPrevious<CR>
let g:ale_fix_on_save = 1

" ----- Golang -----
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_hightlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_command = "goimports"

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

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" ----- TagBar -----
" :help tagbar

map <F7> : TagbarToggle<CR>

" ----- Vista.vim -----

" map <F7> : Vista!!<CR>

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

" toggle paste mode

set pastetoggle=<F2>

" better completeopt
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
