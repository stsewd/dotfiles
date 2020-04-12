# My dotfiles

- Clone this repo (on your home for example ~/.dotfiles).
- Make symbolics links of the configuration file you want.

## Neovim

![1](https://user-images.githubusercontent.com/4975310/79078281-f4c5d580-7ccc-11ea-8af5-c53e5d136571.png)
![2](https://user-images.githubusercontent.com/4975310/79078284-f7c0c600-7ccc-11ea-8328-b12a47dcf9f6.png)
![3](https://user-images.githubusercontent.com/4975310/79078286-f8f1f300-7ccc-11ea-85ac-81ba18c8db37.png)

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
