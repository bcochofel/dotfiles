"------------------------------------------------------------
" To setup Vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" fix cursor on terminal
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" -----------
" Look & Feel
" -----------

" Theme
Plugin 'arcticicestudio/nord-vim'
" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ---------
" Utilities
" ---------
" Code commenter
Plugin 'preservim/nerdcommenter'
" NerdTree explorer
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Tagbar to view tags in right hand column
Plugin 'majutsushi/tagbar'
" Fuzzy Finder
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" CtrlP 
Plugin 'ctrlpvim/ctrlp.vim'
" Vim Indent Guides
Plugin 'nathanaelkane/vim-indent-guides'
" Super tab
Plugin 'ervandew/supertab'
" Ack file searcher
Plugin 'mileszs/ack.vim'
" Fix indentation
Plugin 'junegunn/vim-easy-align'
" tabular
Plugin 'godlygeek/tabular'

" -------------------
" General Programming
" -------------------
" Better language packs
Plugin 'sheerun/vim-polyglot'
" Neomake Asynchronous linting and make framework
Plugin 'neomake/neomake'
" Syntax checking
Plugin 'vim-syntastic/syntastic'
"Plugin 'w0rp/ale'
" auto pair
Plugin 'jiangmiao/auto-pairs'
" Autocomplete
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
" autocomplete for python
Plugin 'deoplete-plugins/deoplete-jedi'
" formtat source code
Plugin 'sbdchd/neoformat'
" code jump
Plugin 'davidhalter/jedi-vim'

" ---
" GIT
" ---
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-git.git'

" --------
" Markdown
" --------
" depends on: Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" ---------
" Terraform
" ---------
Plugin 'hashivim/vim-terraform'

" -------
" Ansible
" -------
Plugin 'pearofducks/ansible-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ------------------------------------------------------------

" ----------------------
" Features Configuration
" ----------------------

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
"set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
"filetype indent plugin on

" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menuone

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
set completeopt-=preview

" Make sure that coursor is always vertically centered on j/k moves
set so=999

" Enable syntax highlighting
syntax on

" When on, uses highlight-guifg and highlight-guibg attributes in
" the terminal (thus using 24-bit color).
if (has("termguicolors"))
  set termguicolors
endif

" add vertical lines on columns
set colorcolumn=80,120

" Highlight current line - allows you to track cursor position more easily
set cursorline

" cursor FIX for Neovim
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue 
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Display line numbers on the left
set number

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Better command-line completion
set wildmenu

" Set command-line completion mode
set wildmode=list:longest,full

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" -------------------
" Indentation options
" -------------------
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
set tabstop=2

" ---------------------
" Plugins configuration
" ---------------------

" set color scheme
colorscheme nord

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" NERDTree GIT
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ------------
" Mapping Keys
" ------------

" <Leader>: \

" Tabs mapping
" :tabs         list all tabs including their displayed windows
" :tabm 0       move current tab to first
" :tabm         move current tab to last
" :tabm {i}     move current tab to position i+1
" :tabn         go to next tab
" :tabp         go to previous tab
" :tabfirst     go to first tab
" :tablast      go to last tab
" In normal mode, you can type:
" gt            go to next tab
" gT            go to previous tab
" {i}gt         go to tab in position i

" Vim-Indent-Guides
" :IndentGuidesEnable
" :IndentGuidesDisable
" :IndentGuidesToggle

" Edit vimrc configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" " Reload vimrc configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" ----- NERDTree -----
map <F6>            : NERDTreeToggle<CR>
" :help NERDTreeMappings
" t: Open the selected file in a new tab
" i: Open the selected file in a horizontal split window
" s: Open the selected file in a vertical split window
" I: Toggle hidden files
" m: Show the NERD Tree menu
" R: Refresh the tree, useful if files change outside of Vim
" ?: Toggle NERD Tree's quick help

" ----- NERD Commenter -----
" - [count]<leader>cc |NERDCommenterComment|
" Comment out the current line or text selected in visual mode.
" - [count]<leader>cn |NERDCommenterNested|
" Same as cc but forces nesting.
" - [count]<leader>c<space> |NERDCommenterToggle|
" Toggles the comment state of the selected line(s). If the topmost selected
" line is commented, all selected lines are uncommented and vice versa.

" ----- TagBar -----
map <F8>            : TagbarToggle<CR>

" ----- FZF: Fuzzy Finder -----
" :Files
" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" Mapping selecting Mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" ----- CtrlP -----
map <C-p>           : CtrlP<CR>
map <C-t>           : CtrlPBufTag<CR>
map <leader>p       : CtrlPBuffer<CR>

" ----- Neomake -----

" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)
"let g:neomake_open_list = 2

let g:neomake_python_enabled_makers = ['flake8']

" Maker types
" 
" There are two types of makers: file makers (acting on the current buffer) and project makers (acting globally).
"You invoke file makers using :Neomake, and project makers using :Neomake!.

" ----- Syntastic -----

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" YAML
let g:syntastic_yaml_checkers = ['yamllint']

" Ansible
let g:syntastic_ansible_checkers = ['ansible_lint']

" ----- Ack -----
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

" ----- vim-easy-align -----

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ----- vim-markdown -----

" Markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

" nmap <BS> <C-W>h

" Spelling
autocmd BufRead,BufNewFile *.md setlocal spell

" Commands
" :TableFormat: Format the table under the cursor like this.
" Requires Tabular.
" The input table must already have a separator line as the second line of the table. That line only needs to contain the correct pipes |, nothing else is required.
" 
" :Toc: create a quickfix vertical window navigable table of contents with the headers.
" Hit <Enter> on a line to jump to the corresponding line of the markdown file.

" ----- vim-terraform -----
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" HCL
augroup filetypedetect
  au! BufRead,BufNewFile *.hcl setf terraform
augroup END

" ----- vim-ansible -----

let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ob"

" ----- deoplete -----

let g:deoplete#enable_at_startup = 1

" ----- deoplete-jedi -----

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
let g:python_host_prog  = '/usr/bin/python2'
" Skip the check of neovim module
let g:python3_host_skip_check = 0

" ----- neoformat -----

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" ----- jedi-vim -----

" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" How to use jedi-vim
" 
" Move the cursor to the class or method you want to check, then press the various supported shortcut provided by jedi-vim:

" <leader>d: go to definition
" K: check documentation of class or method
" <leader>n: show the usage of a name in current file
" <leader>r: rename a name
