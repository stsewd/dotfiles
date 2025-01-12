# Install Lua Language Server

VERSION=3.13.5
wget \
  https://github.com/LuaLS/lua-language-server/releases/download/$VERSION/lua-language-server-$VERSION-linux-x64.tar.gz \
  -O /tmp/lua-language-server.tar.gz

mkdir -p $HOME/lua-language-server
tar -xzf /tmp/lua-language-server.tar.gz -C $HOME/lua-language-server
