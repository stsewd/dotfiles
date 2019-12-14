# My dotfiles

- Clone this repo (on your home for example ~/.dotfiles).
- Make symbolics links of the configuration file you want.

## Neovim

![1](https://user-images.githubusercontent.com/4975310/58529932-53ac5a00-81a2-11e9-8ca2-99d22e5a6ca5.png)
![2](https://user-images.githubusercontent.com/4975310/58529933-53ac5a00-81a2-11e9-9a59-ded48913cd1b.png)
![3](https://user-images.githubusercontent.com/4975310/58529934-5444f080-81a2-11e9-8a03-4c8bd2329a34.png)
![4](https://user-images.githubusercontent.com/4975310/58529935-5444f080-81a2-11e9-8c1d-9f1f7b8bc80d.png)

### Installation

- First [install Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Make a symbolic link (or just copy the folder) of `config/nvim` to `~/.config/nvim`
- Install [vim plug](https://github.com/junegunn/vim-plug#neovim) (plugin manager)
- Install a [patched font](https://github.com/ryanoasis/nerd-fonts).
  - [The one I use](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete.ttf)
- Select the previous font on your terminal configurations
- Open Neovim and do `:PlugInstall`
   - All the plugins are downloaded to `~/.local/share/nvim/plugged`
- Install a terminal theme.
  - [I use nova](https://github.com/agarrharr/nova-gnome-terminal#installation)

### Installing extras

- Install a clipboard provider.
  - Fedora: `dnf install xclip`
- Install python3 interface
  - `pip install --upgrade --user pynvim` (using [pyenv](https://github.com/pyenv/pyenv-installer) is recommended)
- Install Node for COC. 
  - Using [nvm](https://github.com/nvm-sh/nvm#installation-and-update) is recommended.
- Install ctags
  - Debian based: `apt install exuberant-ctags`
  - Fedora: `dnf install ctags`

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
