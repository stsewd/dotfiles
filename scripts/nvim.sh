# Install Neovim nightly
sudo dnf copr enable agriffis/neovim-nightly
sudo dnf install -y neovim

# Install vim-plug
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
