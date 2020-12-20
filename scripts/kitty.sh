# Update/install kitty
# https://sw.kovidgoyal.net/kitty/binary.html

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n

BIN_DIR=~/.local/bin/
if [[ ! -d "$BIN_DIR" ]]; then
  mkdir -p $BIN_DIR
fi
ln -sf ~/.local/kitty.app/bin/kitty $BIN_DIR

# Update the path to the kitty icon and binary in the kitty.desktop file
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
KITTY_DESKTOP_FILE=~/.local/share/applications/kitty.desktop
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" $KITTY_DESKTOP_FILE
sed -i "s|TryExec=kitty|TryExec=/home/$USER/.local/bin/kitty|g" $KITTY_DESKTOP_FILE
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/bin/kitty|g" $KITTY_DESKTOP_FILE

# Install kitty theme
THEME_DIR=~/.config/kitty/themes
THEME=ayu_mirage.conf

if [[ ! -d "$THEME_DIR" ]]; then
  mkdir -p $THEME_DIR
fi

wget \
  https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/${THEME} \
  -O "${THEME_DIR}/${THEME}"
