# Install ohmyzsh
# https://github.com/ohmyzsh/ohmyzsh

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh /dev/stdin --unattended

# Set as default shell
sudo chsh -s $(which zsh)
