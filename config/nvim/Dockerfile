FROM ubuntu:22.04

# Install latest Neovim
RUN apt update && apt install -y software-properties-common
RUN add-repository ppa:neovim-ppa/unstable
RUN apt update && apt install -y neovim

# Python dependencies
RUN get install -y python3-dev python3-pip
RUN pip3 install pynvim

# Node dependencies
RUN apt install yarn

RUN get install -y git curl

# My configuration
RUN git clone --depth 1 \
    https://github.com/stsewd/dotfiles $HOME/dotfiles

RUN mkdir $HOME/.config/ && \
    ln -s $HOME/dotfiles/config/nvim $HOME/.config/nvim

WORKDIR /src
CMD bash

# Run this Dockerfile with
# $ docker run --rm -it -v `pwd`:/src -v $HOME/.local/share/stsewd-nvim/lazy:/root/.local/share/nvim/lazy ghcr.io/stsewd/neovim
# $ nvim
