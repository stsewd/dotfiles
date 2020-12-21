install:
	sudo dnf install -y \
		util-linux-user \
		clang \
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
		tealdeer \
		perl-Image-ExifTool

	sudo dnf install -y \
		gnome-tweak-tool \
		vlc \
		qbittorrent \
		gnome-shell-theme-flat-remix \
		flat-remix-theme

	# Install docker
	sudo dnf install -y moby-engine
	sudo usermod -aG docker $(whoami)
	sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"

	# Flatpak apps
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install flathub com.spotify.Client
	flatpak install flathub org.signal.Signal
	flatpak install flathub org.kde.krita

	./scripts/zsh.sh
	./scripts/nvim.sh
	./scripts/rust.sh
	./scripts/pyenv.sh

# Should be called after make install
setup:
	touch ~/.notags

	./scripts/fonts.sh
	./scripts/kitty.sh
	./scripts/nvm.sh

	tldr --update
	pyenv update

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
	rm -rf ~/.local/share/nautilus/scripts/
	ln -sf `pwd`/local/share/nautilus/scripts/ ~/.local/share/nautilus/

	sudo ln -sf `pwd`/daemon.json /etc/docker/daemon.json

.PHONY: install symlinks setup
