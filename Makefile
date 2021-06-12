install:
	@echo Installing core packages
	sudo dnf install -y \
		util-linux-user \
		clang \
		kitty \
		zsh \
		xclip \
		encfs \
		ctags \
		wmctrl \
		ripgrep \
		hub \
		direnv \
		bat \
		fzf \
		jq \
		httpie \
		tealdeer \
		tmate \
		nmap \
		seahorse \
		perl-Image-ExifTool

	sudo dnf install -y \
	  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$$(rpm -E %fedora).noarch.rpm \
	  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$$(rpm -E %fedora).noarch.rpm

	sudo dnf install -y \
		gnome-tweak-tool \
		qbittorrent \
		gnome-chess \
		gnome-shell-theme-flat-remix \
		flat-remix-theme

	@echo Installing flatpak apps
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install -y flathub com.spotify.Client
	flatpak install -y flathub org.signal.Signal
	flatpak install -y flathub org.kde.krita
	flatpak install -y flathub com.discordapp.Discord
	flatpak install -y flathub com.github.tchx84.Flatseal
	flatpak install -y flathub org.videolan.VLC

	@echo Install other apps
	./scripts/docker.sh
	./scripts/zsh.sh
	./scripts/nvim.sh
	./scripts/rust.sh

install-after:
	./scripts/nvm.sh
	./scripts/pyenv.sh

# Should be called after make install
setup:
	touch ~/.notags

	@echo Install fonts
	./scripts/fonts.sh

	@echo Setup ssh-agent
	./scripts/ssh.sh

	@echo Setup kitty
	./scripts/kitty.sh

	@echo Install nvm
	./scripts/nvm.sh

	@echo Update tldr
	tldr --update

	@echo Update pyenv
	pyenv update

	@echo Update rust
	rustup update
	rustup self update

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
	ln -sf `pwd`/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
	rm -rf ~/.local/share/nautilus/scripts/
	ln -sf `pwd`/local/share/nautilus/scripts/ ~/.local/share/nautilus/

.PHONY: install install-after symlinks setup
