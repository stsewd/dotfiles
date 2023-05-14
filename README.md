# My dotfiles

- Clone this repo (on your home for example ~/.dotfiles).
- Make symbolics links of the configuration file you want.

## Neovim

![1](https://user-images.githubusercontent.com/4975310/236525846-bd3bd8f4-55f3-4be2-8d59-0be68da2a6c3.png)
![2](https://user-images.githubusercontent.com/4975310/236525835-89f2e10c-cf3e-4018-ac5f-b3253e7765e2.png)

### Installation

- [Install Neovim (nightly version)](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Make a symbolic link (or just copy the folder) of `config/nvim` to `~/.config/nvim`
- Open neovim, the plugin manager and all plugins will be installed automatically

### Test it with Docker

```bash
docker run --rm -it -v `pwd`:/src -v $HOME/.local/share/stsewd-nvim/lazy:/root/.local/share/nvim/lazy ghcr.io/stsewd/neovim
```

Open neovim and start coding.

To update the docker image just run `docker pull ghcr.io/stsewd/neovim`

### Configurations

Check [`config/nvim/`](config/nvim/) for see all the plugins, settings and key-bindings, it's well documented.

## Recommended tools

- [kitty](https://sw.kovidgoyal.net/kitty/) as terminal emulator
- [zsh + ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) as shell
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) for a patched font to have nice characters inside Neovim
  (I use [JetBrains Mono](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFontMono-Regular.ttf))
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/) font with ligatures support
- [fzf](https://github.com/junegunn/fzf) for fuzzy search
- [ripgrep](https://github.com/BurntSushi/ripgrep) for recursive search using regular expressions
- [nvm](https://github.com/nvm-sh/nvm) for installing and managing Node versions
- [pyenv](https://github.com/pyenv/pyenv-installer) for installing and managing Python versions
- [hub](https://hub.github.com/) (git wrapper for GitHub)
- [tldr](https://github.com/dbrgn/tealdeer#installing)

## After install

- Create gnome shortcuts:
  - Open terminal with ctrl-alt-enter
  - Minimize all windows with super-d
  - Open file explorer with super-e
- Install the Gnome extensions from gnome-extensions.txt
- Set the firefox options from firefox-about.txt
- Add ssh/gpg keys
- Copy sensitive configs from private gist
- Create additional firefox profiles (scripts/create-firefox-profile.sh)
- Setup yubikey (yubikey.md)
