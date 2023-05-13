VERSION=3.6.19
TARGET_DIR=~/.local/share/lua-language-server/
DOWLOADED_FILE=/tmp/lua-language-server.tar.gz

wget -O $DOWLOADED_FILE \
  https://github.com/LuaLS/lua-language-server/releases/download/${VERSION}/lua-language-server-${VERSION}-linux-x64.tar.gz

echo lua-language-server downloaded

mkdir -p $TARGET_DIR
tar xf $DOWLOADED_FILE --directory=$TARGET_DIR
