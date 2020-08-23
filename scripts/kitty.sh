# Update/install kitty
# https://sw.kovidgoyal.net/kitty/binary.html

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n


# Install kitty themes

THEME_DIR=~/.config/kitty/themes
if [[ ! -d "$THEME_DIR" ]]; then
  mkdir -p $THEME_DIR
fi

wget \
  https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/ayu_mirage.conf \
  -O "${THEME_DIR}/ayu_mirage.conf"
