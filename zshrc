# If you come from bash you might have to change your $PATH.
export PATH=$HOME/dotfiles/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export EDITOR=nvim
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="amuse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fzf
  docker
  github
  rust
  safe-paste
  zsh-syntax-highlighting
  zsh-completions
  gh
)

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit

# ** User configuration **

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Shorter history
export SAVEHIST=1000
export HISTSIZE=$SAVEHIST


# Python
alias p=python
alias pp=ipython


# Direnv integration
eval "$(direnv hook zsh)"


# Integration with fzf
export FZF_DEFAULT_COMMAND='fd --type=file --hidden --exclude=.git'
FZF_DEFAULT_OPTS='--bind=ctrl-space:toggle-preview --bind=ctrl-d:preview-down --bind=ctrl-f:preview-up'
FZF_DEFAULT_OPTS+=' --no-bold --pointer="" --marker="+" --no-separator --info="inline: " --layout=default --prompt=" "'
export FZF_DEFAULT_OPTS


# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# Neovim
export NVIM_PYTHON_HOST=$PYENV_ROOT/versions/neovim/bin/python


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Node/npm
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"

# Rust
export PATH="$HOME/.rustup:$HOME/.cargo/bin:$PATH"


# Utils
# Check memory usage
alias psmem="ps aux  | awk '{print \$6/1024 \" MB\\t\\t\" \$11}'  | sort -n"
alias cat=bat
alias ts=tree-sitter
alias up='sudo dnf up --refresh -y'
alias clear-meta='exiftool -overwrite_original -ALL= '
alias ls='ls --color=auto --hyperlink=auto'


# Kitty
alias icat="kitty +kitten icat"
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

export BACKGROUND=dark

# SSH
# Make ssh compatible with kitty
alias ssh="TERM=xterm-256color ssh"
# ssh-agent
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# delta
export DELTA_FEATURES=+$BACKGROUND
