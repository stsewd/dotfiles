install:
	sudo dnf install -y \
		zsh \
		xclip \
		encfs \
		ctags \
		wmctrl \
		the_silver_searcher \
		ripgrep \
		hub \
		direnv \
		bat \
		fzf \
		jq \
		perl-Image-ExifTool

	touch ~/.notags

	./scripts/zsh.sh
	./scripts/nvim.sh
	./scripts/rust.sh
	./scripts/pyenv.sh

	cargo install tealdeer

setup:
	./scripts/fonts.sh
	./scripts/kitty.sh
	./scripts/nvm.sh

	pyenv update
	npm install -g yarn

symlinks:
	ln -sf `pwd`/ctags ~/.ctags
	ln -sf `pwd`/gitconfig ~/.gitconfig
	ln -sf `pwd`/gitignore ~/.gitignore
	ln -sf `pwd`/pypirc ~/.pypirc
	ln -sf `pwd`/tmux.conf ~/.tmux.conf
	ln -sf `pwd`/tmate.conf ~/.tmate.conf
	ln -sf `pwd`/zshrc ~/.zshrc
	ln -sf `pwd`/config/nvim/ ~/.config/
	ln -sf `pwd`/config/bat/ ~/.config/
	ln -sf `pwd`/config/kitty/ ~/.config/

	sudo ln -sf `pwd`/daemon.json /etc/docker/daemon.json

.PHONY: install symlinks setup
