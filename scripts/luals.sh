wget \
  https://github.com/LuaLS/lua-language-server/releases/download/3.11.1/lua-language-server-3.11.1-linux-x64.tar.gz \
  -O /tmp/lua-language-server.tar.gz

mkdir -p /$HOME/lua-language-server
tar -xzf /tmp/lua-language-server.tar.gz -C $HOME/lua-language-server
