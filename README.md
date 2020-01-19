# dotfiles

Dotfiles for user profile.

It uses the following:

- Window Manager: i3
- Linux terminal: terminator/kitty
- Editor: vim/neovim + vundle plugins
- Shell: zsh + oh-my-zsh

## TL;DR

```bash
# install applications
sudo apt install git unzip curl wget i3 conky feh rofi scrot terminator neovim zsh zsh-syntax-highlighting ttf-ancient-fonts

# clone dotfiles repo
git clone https://github.com/bcochofel/dotfiles.git

# install ttf font
mkdir ~/.local/share/fonts
cp dotfiles/.config/i3/i3status-conky/fontawesome-webfont.ttf ~/.local/share/fonts
fc-cache -f -v

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh bullet-train theme
cd ~/.oh-my-zsh/themes/
curl -O https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme

# zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

chsh -s $(which zsh)

# install kitty
cd
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
```

## Install zsh/neovim on Ubuntu

```bash
apt install zsh zsh-syntax-highlighting neovim ttf-ancient-fonts zsh-theme-powerlevel9k
```

## Install oh-my-zsh

https://github.com/ohmyzsh/ohmyzsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd .oh-my-zsh/themes/
curl -o https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme

chsh -s $(which zsh)
```

## Install Kitty terminal

https://sw.kovidgoyal.net/kitty/

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

cat <<EOF > .config/kitty/kitty.conf
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
```

## Install NeoVim

https://neovim.io/

## Install i3 window manager

https://i3wm.org/
