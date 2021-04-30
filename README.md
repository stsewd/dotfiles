# My dotfiles

- Clone this repo (on your home for example ~/.dotfiles).
- Make symbolics links of the configuration file you want.

## Neovim

![1](https://user-images.githubusercontent.com/4975310/79078281-f4c5d580-7ccc-11ea-8af5-c53e5d136571.png)
![2](https://user-images.githubusercontent.com/4975310/79078284-f7c0c600-7ccc-11ea-8328-b12a47dcf9f6.png)
![3](https://user-images.githubusercontent.com/4975310/79078286-f8f1f300-7ccc-11ea-85ac-81ba18c8db37.png)

### Installation

- [Install Neovim (nightly version)](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Make a symbolic link (or just copy the folder) of `config/nvim` to `~/.config/nvim`
- Install [vim plug](https://github.com/junegunn/vim-plug#neovim) (plugin manager)
- Open Neovim and do `:PlugInstall`

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

## Recommended tools

- [kitty](https://sw.kovidgoyal.net/kitty/) as terminal emulator
- [zsh + ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) as shell
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) for a patched font to have nice characters inside Neovim
  (I use [JetBrains Mono](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf))
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/) font with ligatures support
- [fzf](https://github.com/junegunn/fzf) for fuzzy search
- [ripgrep](https://github.com/BurntSushi/ripgrep) for recursive search using regular expressions
- [nvm](https://github.com/nvm-sh/nvm) for installing and managing Node versions
- [pyenv](https://github.com/pyenv/pyenv-installer) for installing and managing Python versions
- [hub](https://hub.github.com/) (git wrapper for GitHub)
- [tldr](https://github.com/dbrgn/tealdeer#installing)
