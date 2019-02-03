# My dotfiles

- Clone this repo (on your home for example ~/.dotfiles).
- Make symbolics links of the configuration file you want.

## Neovim

![1](https://user-images.githubusercontent.com/4975310/36638015-50c4a3ec-19b6-11e8-9591-397d674c8099.png)
![2](https://user-images.githubusercontent.com/4975310/36638014-50a6f11c-19b6-11e8-8304-2aca8c5a1d94.png)
![3](https://user-images.githubusercontent.com/4975310/36638013-50869b1a-19b6-11e8-9143-1ed04a06d677.png)

### Installation

- First [install Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Make a symbolic link (or just copy the folder) of `config/nvim` to `~/.config/nvim`
- Install [vim plug](https://github.com/junegunn/vim-plug#neovim) (plugin manager)
- Install a [patched font](https://github.com/ryanoasis/nerd-fonts).
  - [The one I use](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraMono/Regular/complete/Fura%20Mono%20Regular%20Nerd%20Font%20Complete.otf)
- Select the previous font on your terminal configurations
- Install [nova for gnome terminal](https://github.com/agarrharr/nova-gnome-terminal#installation) (only if you want to use that theme with Neovim)
- Open Neovim and do `:PlugInstall`
   - All the plugins are downloaded to `~/.local/share/nvim/plugged`

### Installing extras

- Install python3 interface
  - `pip install --upgrade pynvim`
- Install ctags
  - Debian based: `apt install exuberant-ctags`
  - Fedora: `dnf install ctags`
- Install markdown preview
  - `npm install -g livedown`
- Tools for python development :snake:
  - `pip install jedi`
  - `pip install flake8`
  - `pip install mypy`
- Tools for VimL development
  - `pip install vim-vint`

### Test it with Docker

```bash
docker run --rm -it -v `pwd`:/src -v $HOME/.local/share/stsewd-nvim/plugged:/root/.local/share/nvim/plugged stsewd/neovim
```

Install the plugins

```bash
nvim +PlugInstall
```

Reopen Neovim and start coding.

To update the docker image just run `docker pull stsewd/neovim`

### Configurations

Check [`config/nvim/init.vim`](config/nvim/init.vim) for see all the plugins, settings and key-bindings, it's well documented.
