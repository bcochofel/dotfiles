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
sudo apt install python3-pip exuberant-ctags ack-grep
sudo pip3 install pynvim flake8 pylint isort
```

# Git your dotfiles

Take a look at: https://www.atlassian.com/git/tutorials/dotfiles to keep your dotfiles managed by Git.

# Install dotfiles

Using the method described before you can clone the Git repository to your home.

## Start your repository from scratch

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

Clone repoitory

```bash
alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/bcochofel/dotfiles.git $HOME/.dotfiles
alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
mkdir -p ~/.config-backup
gitdotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} ~/.config-backup/{}
gitdotfiles checkout
gitdotfiles config --local status.showUntrackedFiles no
gitdotfiles status
echo "alias gitdotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
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
# create symbolic link for neovim
ln -s ~/.vimrc ~/.config/nvim/init.vim
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
