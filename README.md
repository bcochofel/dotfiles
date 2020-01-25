# Dotfiles for user profile.

It uses the following:

- Window Manager: i3
- Linux terminal: terminator/kitty/tilix
- Editor: vim/neovim + vundle plugins
- Shell: zsh + oh-my-zsh

# Dependencies

```bash
sudo apt install curl wget git unzip gnome-control-center gnome-screensaver apt-file mc
```

# Git your dotfiles

Take a look at: https://www.atlassian.com/git/tutorials/dotfiles to keep your dotfiles managed by Git.

# i3 Window manager

https://i3wm.org/

## Install packages

```bash
sudo apt install i3 i3blocks i3lock i3lock-fancy i3status xautolock conky feh rofi scrot pulseaudio-utils xbacklight
```

# Zsh + oh-my-zsh

## Install packages

```bash
sudo apt install zsh zsh-syntax-highlighting ttf-ancient-fonts fonts-powerline fonts-font-awesome
```

## Install oh-my-zsh

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

# Install terminals

https://terminator-gtk3.readthedocs.io/en/latest/gettingstarted.html

https://gnunn1.github.io/tilix-web/

## Install packages

```bash
sudo apt install terminator tilix
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
```

## @TODO

Tilix profile backup/restore

## Install kitty

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
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
# Update the path to the kitty icon in the kitty.desktop file
sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop
```

## Install NeoVim

https://neovim.io/

```bash
# install vundle for neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
cp ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
vim +PluginInstall +qall
vim +UpdateRemotePlugins +qall
```
