FROM ubuntu:18.04

# Install latest Neovim
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update && apt-get install -y neovim

# Python dependencies
RUN apt-get install -y python3-dev python3-pip
RUN pip3 install pynvim

RUN apt-get install -y git curl

# My configuration
RUN git clone --depth 1 \
    https://github.com/stsewd/dotfiles $HOME/dotfiles

RUN mkdir $HOME/.config/ && \
    ln -s $HOME/dotfiles/config/nvim $HOME/.config/nvim

## Install vim-plug
RUN curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

WORKDIR /src
CMD bash

# Run this Dockerfile with
# $ docker run --rm -it -v `pwd`:/src -v $HOME/.local/share/stsewd-nvim/plugged:/root/.local/share/nvim/plugged stsewd/neovim
# $ nvim +PlugInstall
# :qa
# $ nvim
