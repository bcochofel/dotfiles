# Dotfiles for user profile.

It uses the following:

- Window Manager: i3
- Linux terminal: terminator/kitty/tilix
- Editor: vim/neovim + vundle plugins
- Shell: zsh + oh-my-zsh

# Install Dependencies/Packages

```bash
sudo apt install curl wget git unzip gnome-control-center gnome-screensaver apt-file mc
sudo apt install i3 i3blocks i3lock i3lock-fancy i3status xautolock conky feh rofi scrot pulseaudio-utils xbacklight
sudo apt install zsh zsh-syntax-highlighting ttf-ancient-fonts fonts-powerline fonts-font-awesome
sudo apt install terminator tilix
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
sudo apt install vim neovim
sudo apt install python3-pip exuberant-ctags ack-grep silversearcher-ag
sudo pip3 install pynvim flake8 pylint isort yamllint ansible-lint jedi autopep8 yapf docformatter
```

# Git your dotfiles

Take a look at: https://www.atlassian.com/git/tutorials/dotfiles to keep your dotfiles managed by Git.

# Install dotfiles

Using the method described before you can clone the Git repository to your home.

# Start your repository from scratch

```bash
git init --bare $HOME/.dotfiles
alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
gitdotfiles config --local status.showUntrackedFiles no
echo "alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

## Install your dotfiles onto a new system (or migrate to this setup)

Install and configure dependencies

```bash
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# oh-my-zsh bullet-train theme
cd ~/.oh-my-zsh/themes/
curl -O https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme

# zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

chsh -s $(which zsh)

# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

Clone repository

```bash
alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/bcochofel/dotfiles.git $HOME/.dotfiles
alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
mkdir -p ~/.config-backup
gitdotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} ~/.config-backup/{}
gitdotfiles checkout
gitdotfiles config --local status.showUntrackedFiles no
gitdotfiles status
#echo "alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

Additional configuration

```bash
# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
# your PATH)
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/applications
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
# Update the path to the kitty icon in the kitty.desktop file
sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop

# install vundle on vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
vim +UpdateRemotePlugins +qall
# create symbolic link for neovim config
ln -s ~/.vimrc ~/.config/nvim/init.vim
# choose default terminal
sudo update-alternatives --set x-terminal-emulator /usr/bin/terminator
```

# Install manually

## i3 Window manager

https://i3wm.org/

### Install packages

```bash
sudo apt install i3 i3blocks i3lock i3lock-fancy i3status xautolock conky feh rofi scrot pulseaudio-utils xbacklight
```

## Zsh + oh-my-zsh

### Install packages

```bash
sudo apt install zsh zsh-syntax-highlighting ttf-ancient-fonts fonts-powerline fonts-font-awesome
```

### Install oh-my-zsh

https://github.com/ohmyzsh/ohmyzsh

```bash
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# oh-my-zsh bullet-train theme
cd ~/.oh-my-zsh/themes/
curl -O https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme

# zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

chsh -s $(which zsh)
```

## Install terminals

https://terminator-gtk3.readthedocs.io/en/latest/gettingstarted.html

https://gnunn1.github.io/tilix-web/

### Install packages

```bash
sudo apt install terminator tilix
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
```

### Tilix Backup and Restore configuration

dconf dump /com/gexperts/Tilix/ > tilix.dconf
dconf load /com/gexperts/Tilix/ < tilix.dconf

### Install kitty

https://sw.kovidgoyal.net/kitty/

```bash
# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

cat <<EOF > ~/.config/kitty/kitty.conf
# vim:fileencoding=utf-8:ft=conf

# Font family. You can also specify different fonts for the
# bold/italic/bold-italic variants. By default they are derived automatically,
# by the OSes font system. Setting them manually is useful for font families
# that have many weight variants like Book, Medium, Thick, etc. For example:
# font_family Operator Mono Book
# bold_font Operator Mono Thick
# bold_italic_font Operator Mono Medium
# font_family      Input Mono
font_family      Fantasque Sans Mono
italic_font      auto
bold_font        auto
bold_italic_font auto

# Font size (in pts)
font_size        11.0

# The foreground color
foreground       #00FF00

# The background color
background       #000000
EOF

# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
# your PATH)
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/applications
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
# Update the path to the kitty icon in the kitty.desktop file
sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop
```

## Install Vim/NeoVim

https://neovim.io/

```bash
sudo apt install vim neovim

# install vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/.vimrc ~/.config/nvim/init.vim
vim +PluginInstall +qall
vim +UpdateRemotePlugins +qall
```

## Clone repository

```bash
git clone https://github.com/bcochofel/dotfiles.git
# copy the structure to your home
mkdir ~/Pictures/screenshots
# change ~/.config/i3blocks/config and adapt to network devices
```

# Plugin Manager

## Install Vundle

https://github.com/VundleVim/Vundle.vim

```bash
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## Configure Vundle

Edit ~/.vimrc

```bash
"------------------------------------------------------------
" To setup Vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" insert here your plugins

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

"------------------------------------------------------------
```

## Install plugins

Run the following command to install plugins:

```bash
vim +PluginInstall +qall
```

to update plugins run:

```bash
vim +UpdateRemotePlugins +qall
```

# Useful plugins

## Look & Feel

- https://github.com/arcticicestudio/nord-vim
- https://github.com/vim-airline/vim-airline
- https://github.com/vim-airline/vim-airline-themes

## Utilities

- [NERDCommenter: Comment functions so powerful—no comment necessary.](https://github.com/preservim/nerdcommenter)
- [NERDTree: a file system explorer for the Vim editor.](https://github.com/preservim/nerdtree)
- [NERDTree-GIT: A plugin of NERDTree showing git status flags.](https://github.com/Xuyuanp/nerdtree-git-plugin)
- [Tagbar: a class outline viewer for Vim](https://github.com/majutsushi/tagbar)
  - Dependencies: sudo apt install exuberant-ctags
- [FZF: A command-line fuzzy finder.](https://github.com/junegunn/fzf.vim)
- [CtrlP: Full path fuzzy file, buffer, mru, tag, ... finder for Vim.](https://github.com/ctrlpvim/ctrlp.vim)
- [Vim-Indent: Indent Guides is a plugin for visually displaying indent levels in Vim.](https://github.com/nathanaelkane/vim-indent-guides)
- [SuperTab: vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).](https://github.com/ervandew/supertab)
- [Ack: Run your favorite search tool from Vim, with an enhanced results list.](https://github.com/mileszs/ack.vim)
  - Dependencies: sudo apt install ack-grep
- [Vim-easy-alin: A simple, easy-to-use Vim alignment plugin.](https://github.com/junegunn/vim-easy-align)
- [tabular: Vim script for text filtering and alignment ](https://github.com/godlygeek/tabular)
- [vim-gutentags: A Vim plugin that manages your tag files](https://github.com/ludovicchabant/vim-gutentags)
- [vim-repeat: repeat.vim: enable repeating supported plugin maps with "."](https://github.com/tpope/vim-repeat)
- [vim-swoop: It allows you to find and replace occurrences in many buffers being aware of the context.](https://github.com/pelodelfuego/vim-swoop)
- [vim-mark: Highlight several words in different colors simultaneously.](https://github.com/inkarkat/vim-mark)

## General Programming

- [vim-polyglot: A solid language pack for Vim.](https://github.com/sheerun/vim-polyglot)
- [Neomake: Asynchronous linting and make framework for Neovim/Vim](https://github.com/neomake/neomake)
  - Dependencies: pip install pylint yamllint ansible-lint flake8
- [auto-pairs: Insert or delete brackets, parens, quotes in pair.](https://github.com/jiangmiao/auto-pairs)
- [Syntastic: Syntax checking hacks for vim](https://github.com/vim-syntastic/syntastic)
  - Dependencies: pip install yamllint ansible-lint
- [Deoplete: Dark powered asynchronous completion framework for neovim/Vim8](https://github.com/Shougo/deoplete.nvim)
  - Dependencies: pip install pynvim
- [Deoplete-jedi: deoplete.nvim source for Python](https://github.com/deoplete-plugins/deoplete-jedi)
  - Dependencies: pip install jedi
- [Neoformat: A (Neo)vim plugin for formatting code.](https://github.com/sbdchd/neoformat)
  - Dependencies: pip install autopep8 yapf docformatter
- [jedi-vim: jedi-vim - awesome Python autocompletion with VIM](https://github.com/davidhalter/jedi-vim)

## GIT

- [vim-fugitive: A Git wrapper so awesome, it should be illegal](https://github.com/tpope/vim-fugitive)
- [vim-git: Vim Git runtime files](https://github.com/tpope/vim-git)

## Tmux

- [vim-tmux-navigator: Navigation between tmux and vim](https://github.com/christoomey/vim-tmux-navigator)

## Markdown

- [vim-markdown: Markdown Vim Mode](https://github.com/plasticboy/vim-markdown)

## Terraform

- [vim-terraform: basic vim/terraform integration](https://github.com/hashivim/vim-terraform)
  - Depends: terraform binary

## Ansible

- [vim-ansible: A vim plugin for syntax highlighting Ansible's common filetypes](https://github.com/pearofducks/ansible-vim)
