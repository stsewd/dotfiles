# Install/update kitty theme
THEME_DIR=~/.config/kitty/themes
THEME=ayu_mirage.conf

if [[ ! -d "$THEME_DIR" ]]; then
  mkdir -p $THEME_DIR
fi

wget \
  https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/${THEME} \
  -O "${THEME_DIR}/${THEME}"

wget \
  https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/kitty_tokyonight_storm.conf \
  -O "${THEME_DIR}/tokyonight-storm.conf"
