# Download and install the latast version of jetbrains mono.
# https://www.jetbrains.com/lp/mono/

FONT_NAME=JetBrainsMono-2.242.zip
wget -O /tmp/fonts.zip https://download.jetbrains.com/fonts/${FONT_NAME}
unzip -od /tmp/fonts/ /tmp/fonts.zip

FONTS_DIR=/tmp/fonts/fonts/ttf
FONTS_TARGET_DIR=$HOME/.local/share/fonts/
mkdir -p $FONTS_TARGET_DIR

cp -v \
  $FONTS_DIR/JetBrainsMono-Regular.ttf \
  $FONTS_DIR/JetBrainsMono-Bold.ttf \
  $FONTS_DIR/JetBrainsMono-Italic.ttf \
  $FONTS_DIR/JetBrainsMono-BoldItalic.ttf \
  $FONTS_TARGET_DIR

wget --directory-prefix=$FONTS_TARGET_DIR https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
