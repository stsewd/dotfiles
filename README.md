# My dotfiles

- Clone this repo (on your home for example ~/.dotfiles).
- Make symbolics links of the configuration file you want.

## Neovim

![](https://cloud.githubusercontent.com/assets/4975310/25513658/734edbd4-2b9c-11e7-80f1-6543827bda2b.png)
![](https://cloud.githubusercontent.com/assets/4975310/25776767/c861a5b4-328d-11e7-8fb2-c7aed5337bdd.png)


### Installation

- First [install neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Make a symbolic link (or just copy the folder) of `config/nvim` to `~/.config/nvim`
- Install [vim plug](https://github.com/junegunn/vim-plug#neovim) (plugin manager)
- Install a [pathched font](https://github.com/ryanoasis/nerd-fonts).
  - [The one I use](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.ttf)
- Select the previous font on your terminal configurations
- Install [one dark gnome terminal](https://github.com/denysdovhan/one-gnome-terminal#instalation) (only if you want to use that theme with neovim)
- Open neovim and do `:PlugInstall`
   - All the plugins are downloaded to `~/.local/share/nvim/plugged`

### Installing extras

- Compile [YouCompleteme](https://github.com/Valloric/YouCompleteMe#installation)
- Install ctags
  - Debian based: `apt install exuberant-ctags`
  - Fedora: `dnf install ctags`
- Install markdown preview
  - `npm install -g livedown`
- Install flake8 for python develpment :snake:
  - `pip install flake8`
  
### Configurations

Check `config/nvim/init.vim` for see all the plugins, settings and key-bindings, it's well documented.
