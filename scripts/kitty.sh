# Update/install kitty
# https://sw.kovidgoyal.net/kitty/binary/
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n

BIN_DIR=~/.local/bin/
if [[ ! -d "$BIN_DIR" ]]; then
  mkdir -p $BIN_DIR
fi
ln -sf ~/.local/kitty.app/bin/kitty $BIN_DIR

# Update the path to the kitty icon and binary in the kitty.desktop file
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
KITTY_DESKTOP_FILE=~/.local/share/applications/kitty.desktop
sed -i "s|^Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" $KITTY_DESKTOP_FILE
sed -i "s|Exec=kitty|Exec=${BIN_DIR}kitty|g" $KITTY_DESKTOP_FILE

# Set theme
mkdir -p ~/.config/kitty/
kitty +kitten themes --dump-theme 'Tokyo Night Storm' > ~/.config/kitty/current-theme.conf
