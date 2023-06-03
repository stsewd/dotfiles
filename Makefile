install:
	@echo Updating current packages
	sudo dnf up --refresh -y

	@echo Installing core packages
	sudo dnf install -y \
		util-linux-user \
		openssl	\
		openssh-askpass \
		setroubleshoot \
		clang \
		clang-tools-extra \
		zsh \
		xclip \
		encfs \
		wmctrl \
		ripgrep \
		fd-find \
		hub \
		direnv \
		bat \
		nodejs \
		fzf \
		jq \
		httpie \
		tealdeer \
		tmate \
		gh \
		nmap \
		seahorse \
		pam_yubico \
		perl-Image-ExifTool \
		ImageMagick \
		git-delta

	@echo Installing rpmfusion repos
	sudo dnf install -y \
	  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$$(rpm -E %fedora).noarch.rpm \
	  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$$(rpm -E %fedora).noarch.rpm

	@echo Installing additional apps
	sudo dnf install -y \
		gnome-tweak-tool \
		gnome-extensions-app \
		qbittorrent \
		gnome-shell-theme-flat-remix \
		flat-remix-theme \
		vlc

	@echo Installing Proton VPN
	./scripts/protonvpn.sh

	@echo Installing flatpak apps
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install -y flathub com.spotify.Client
	flatpak install -y flathub org.signal.Signal
	flatpak install -y flathub org.kde.krita
	flatpak install -y flathub com.discordapp.Discord
	flatpak install -y flathub com.github.tchx84.Flatseal
	flatpak install -y flathub com.calibre_ebook.calibre
	flatpak install -y flathub com.google.AndroidStudio
	flatpak install -y flathub org.chromium.Chromium

	@echo Install fonts
	./scripts/fonts.sh

	@echo Setup ssh-agent
	./scripts/ssh.sh

	@echo Install kitty
	./scripts/kitty.sh

	@echo Install other apps
	./scripts/docker.sh
	./scripts/nvim.sh
	./scripts/rust.sh
	./scripts/node.sh
	./scripts/nvm.sh
	./scripts/pyenv.sh
	./scripts/zsh.sh

# Should be called after make install, and in a fresh shell.
setup:
	pip install --user pipx
	pipx install black
	pipx install td-watson

	@echo Install rust packages
	cargo install stylua

	# TODO: mvm isn't found when executed from the makefile :/
	# I'm not actively using node,
	# and I'm installing node globally from dnf.
	# nvm install node
	@echo Install node packages
	npm install -g yarn
	npm install -g tree-sitter-cli
	npm install -g prettier

	@echo Update tldr
	tldr --update

	@echo Update pyenv
	pyenv update

	@echo Update rust
	rustup self update
	rustup update

symlinks:
	ln -sf `pwd`/gitconfig ~/.gitconfig
	ln -sf `pwd`/gitignore ~/.gitignore
	ln -sf `pwd`/pypirc ~/.pypirc
	ln -sf `pwd`/tmux.conf ~/.tmux.conf
	ln -sf `pwd`/tmate.conf ~/.tmate.conf
	ln -sf `pwd`/zshrc ~/.zshrc
	ln -sf `pwd`/config/gdb/ ~/.config/
	ln -sf `pwd`/config/nvim/ ~/.config/
	ln -sf `pwd`/config/bat/ ~/.config/
	ln -sf `pwd`/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
	ln -sf `pwd`/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
	rm -rf ~/.local/share/nautilus/scripts/
	ln -sf `pwd`/local/share/nautilus/scripts/ ~/.local/share/nautilus/

.PHONY: install install-after symlinks setup
