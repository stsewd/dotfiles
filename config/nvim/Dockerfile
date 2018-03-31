FROM ubuntu:16.04

# Install latest Neovim
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update
RUN apt-get install -y neovim

# Python dependencies
RUN apt-get install -y python-dev python-pip python3-dev python3-pip
RUN pip install neovim
RUN pip3 install neovim

RUN apt-get install -y git curl

# My configuration
RUN git clone --depth 1 \
    https://github.com/stsewd/dotfiles /code

RUN mkdir ~/.config/ && ln -s /code/config/nvim ~/.config/nvim

## Install vim-plug
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# docker run --rm -it -v `pwd`:/src -v `pwd`/.local/share/stsewd-nvim/plugged:/root/.local/share/nvim/plugged stsewd/neovim

WORKDIR /src
CMD bash
