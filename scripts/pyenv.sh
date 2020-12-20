# Install pyenv
# https://github.com/pyenv/pyenv-installer

curl https://pyenv.run | bash

# Pyenv requirements
sudo dnf install -y \
    make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel

# Create neovim environment
pyenv install 3.9.1
pyenv virtualenv --force 3.9.1 neovim
PATH="$PYENV_ROOT/versions/neovim/bin:$PATH" pip install --upgrade pip pynvim
