" START Vundle Configuration  

set nocompatible 
filetype off 

" set the runtime path to include Vundle and initialize 
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin() 

" let Vundle manage Vundle, required 
Plugin 'VundleVim/Vundle.vim' 

" fuzzy finder: https://github.com/junegunn/fzf.vim (:Files) 
Plugin 'junegunn/fzf' 
Plugin 'junegunn/fzf.vim' 

" lightline: https://github.com/itchyny/lightline.vim 
Plugin 'itchyny/lightline.vim' 

" vim-multiple-cursors: https://github.com/terryma/vim-multiple-cursors 
"Plugin 'terryma/vim-multiple-cursors' 

" vim-eunuch: https://github.com/tpope/vim-eunuch 
"Plugin 'tpope/vim-eunuch' 

" vim-surround: https://github.com/tpope/vim-surround 
Plugin 'tpope/vim-surround' 

" nerdtree: https://github.com/scrooloose/nerdtree (:NERDTreeToggle) 
Plugin 'scrooloose/nerdtree' 

" neocomplete 
"Plugin 'Shougo/neocomplete.vim' 

Plugin 'vim-syntastic/syntastic' 
Plugin 'Townk/vim-autoclose' 

" python vim
Plugin 'klen/python-mode' 

" editorconfig: https://github.com/editorconfig/editorconfig-vim
Plugin 'editorconfig/editorconfig-vim' 

" emmet: https://github.com/mattn/emmet-vim 
"Plugin 'mattn/emmet-vim' 

" Git Support 
Plugin 'kablamo/vim-git-log' 
Plugin 'gregsexton/gitv' 
Plugin 'tpope/vim-fugitive' 
"Plugin 'jaxbot/github-issues.vim' 

" Markdown / Writting 
Plugin 'reedes/vim-pencil' 
Plugin 'tpope/vim-markdown' 
Plugin 'jtratner/vim-flavored-markdown' 
Plugin 'LanguageTool' 

"vim-ansible-yaml: https://github.com/pearofducks/ansible-vim 
"Plugin 'chase/vim-ansible-yaml' 
"Plugin 'pearofducks/ansible-vim'
Plugin 'erikzaadi/vim-ansible-yaml'

"hashivim/vim-hashicorp-tools: https://github.com/hashivim/vim-hashicorp-tools
Plugin 'hashivim/vim-hashicorp-tools'

call vundle#end() 
filetype plugin indent on 

" Brief help 
" :PluginList       - lists configured plugins 
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate 
" :PluginSearch foo - searches for foo; append `!` to refresh local cache 
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal 

" lightline 
set laststatus=2 
if !has('gui_running') 
  set t_Co=256 
endif 

" ansible vim 
augroup ansible
au!
au BufRead,BufNewFile *.yml set filetype=yaml.ansible 
au BufRead,BufNewFile *.yaml set filetype=yaml.ansible 
let g:ansible_unindent_after_newline = 1 
let g:ansible_attribute_highlight = "ob" 
let g:ansible_name_highlight = 'd' 
let g:ansible_extra_keywords_highlight = 1 
au FileType yaml.ansible set colorcolumn=2,4,6,8
au FileType yaml.ansible highlight ColorColumn ctermbg=8
augroup END

" vim-terraform
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" Syntastic Configuration 
set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()} 
set statusline+=%* 
let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1 
" let g:syntastic_check_on_wq = 0 
" let g:syntastic_enable_elixir_checker = 1 
" let g:syntastic_elixir_checkers = ["elixir"] 

" Markdown Syntax Support 
augroup markdown 
au! 
au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown 
augroup END 

" Neocomplete Settings 
let g:acp_enableAtStartup = 0 
let g:neocomplete#enable_at_startup = 1 
let g:neocomplete#enable_smart_case = 1 
let g:neocomplete#sources#syntax#min_keyword_length = 3 
