# Download and install the latast version of jetbrains mono.
# https://www.jetbrains.com/lp/mono/

FONT_NAME=JetBrainsMono-2.001.zip
wget -O /tmp/fonts.zip https://download.jetbrains.com/fonts/${FONT_NAME}
unzip -od /tmp/fonts/ /tmp/fonts.zip

FONT_DIR=/tmp/fonts/ttf
cp -v \
  $FONT_DIR/JetBrainsMono-Regular.ttf \
  $FONT_DIR/JetBrainsMono-Bold.ttf \
  $FONT_DIR/JetBrainsMono-Italic.ttf \
  $FONT_DIR/JetBrainsMono-Bold-Italic.ttf \
  ~/.local/share/fonts
