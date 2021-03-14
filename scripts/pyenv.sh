# Install pyenv
# https://github.com/pyenv/pyenv-installer

curl https://pyenv.run | bash

# Pyenv requirements
sudo dnf install -y \
    make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel

pyenv install 3.9.2
pyenv install 3.6.13

# Create neovim environment
pyenv virtualenv --system-site-packages --force system neovim
PATH="$PYENV_ROOT/versions/neovim/bin:$PATH" pip install --upgrade pip pynvim pydbus sphinx
