# Dotfiles for user profile.

It uses the following:

- Window Manager: i3
- Linux terminal: terminator/kitty/tilix
- Editor: vim/neovim + plugins
- Shell: zsh + oh-my-zsh

# Install Dependencies/Packages

## Install Utilities

```bash
sudo apt install -y imagemagick tree curl wget git unzip apt-file mc \
  exuberant-ctags ack-grep silversearcher-ag ripgrep golang
```

## Install i3 Window Manager

```bash
sudo apt install -y i3 i3blocks i3lock i3lock-fancy i3status xautolock conky feh rofi \
  gnome-control-center gnome-screensaver scrot pulseaudio-utils xbacklight
```

## Install zsh

```bash
sudo apt install -y zsh zsh-syntax-highlighting ttf-ancient-fonts fonts-powerline fonts-font-awesome
```

## Install terminal emulators

```bash
sudo apt install -y terminator tilix tmux
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
```

### Tmux Plugins

https://tmuxcheatsheet.com/tmux-plugins-tools/

### Tmux TPM

Install Tmux Plugin Manager

https://github.com/tmux-plugins/tpm

## Install Vim and plugin dependencies

```bash
sudo apt install -y vim
sudo apt install -y python3-pip exuberant-ctags ack-grep silversearcher-ag
```

### Linters/Fixers

Install the following linters/fixers

```bash
sudo pip3 install pynvim flake8 pylint isort yamllint ansible-lint jedi \
  autopep8 yapf docformatter proselint
```

#### Terraform

https://github.com/terraform-linters/tflint

```bash
curl -L "$(curl -Ls https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" -o tflint.zip && unzip tflint.zip && rm tflint.zip
sudo mv tflint /usr/local/bin
```

## Install neovim

```bash
sudo apt install -y neovim
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
cd

# zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

chsh -s $(which zsh)

# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# screenshots
mkdir ~/Pictures/screenshots
```

Clone repository

```bash
cd
alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> $HOME/.gitignore
git clone --bare https://github.com/bcochofel/dotfiles.git $HOME/.dotfiles
alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
mkdir -p ~/.config-backup
gitdotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} ~/.config-backup/{}
gitdotfiles checkout
gitdotfiles config --local status.showUntrackedFiles no
gitdotfiles status
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
# choose default terminal
sudo update-alternatives --set x-terminal-emulator /usr/bin/terminator
```

Neovim configuration

```bash
# create symbolic link for neovim config
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
```

# Plugin Manager

## Install Vim-Plug

https://github.com/junegunn/vim-plug

## Install Vundle

https://github.com/VundleVim/Vundle.vim

# Useful plugins

## Look & Feel

- https://github.com/arcticicestudio/nord-vim
- https://github.com/vim-airline/vim-airline
- https://github.com/vim-airline/vim-airline-themes
- https://github.com/itchyny/lightline.vim

## Utilities

- [NERDCommenter: Comment functions so powerful—no comment necessary.](https://github.com/preservim/nerdcommenter)
- [NERDTree: a file system explorer for the Vim editor.](https://github.com/preservim/nerdtree)
- [NERDTree-GIT: A plugin of NERDTree showing git status flags.](https://github.com/Xuyuanp/nerdtree-git-plugin)
- [Vista.vim: Viewer and finder for LSP symbols and
  tabs](https://github.com/liuchengxu/vista.vim)
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
- [vim-tmux-navigator: Seamless navigation between tmux panes and vim splits](https://github.com/christoomey/vim-tmux-navigator)

## General Programming

- [vim-polyglot: A solid language pack for Vim.](https://github.com/sheerun/vim-polyglot)
- [Neomake: Asynchronous linting and make framework for Neovim/Vim](https://github.com/neomake/neomake)
  - Dependencies: pip install pylint yamllint ansible-lint flake8
- [auto-pairs: Insert or delete brackets, parens, quotes in pair.](https://github.com/jiangmiao/auto-pairs)
- [Syntastic: Syntax checking hacks for vim](https://github.com/vim-syntastic/syntastic)
  - Dependencies: pip install yamllint ansible-lint
- [ALE: Check syntax in Vim asynchronously and fix files](https://github.com/dense-analysis/ale)
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

# References

- [i3 Window manager](https://i3wm.org/)
- [Install oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Terminator emulator](https://terminator-gtk3.readthedocs.io/en/latest/gettingstarted.html)
- [Tilix](https://gnunn1.github.io/tilix-web/)
- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [Neovim](https://neovim.io/)
