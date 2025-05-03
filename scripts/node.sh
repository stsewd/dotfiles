# Allow to install global packages without sudo.
mkdir ~/.npm-packages
npm config set prefix ~/.npm-packages

npm install -g tree-sitter-cli
# Formatter for js, html, css, json, etc.
npm install -g prettier
# Python LSP
npm install -g pyright
# HTML, CSS, JS, JSON LSP
npm install -g vscode-langservers-extracted
# TypeScript LSP
npm install -g typescript typescript-language-server
npm install -g yaml-language-server
# PHP LSP
npm install -g intelephense
npm install -g bash-language-server
