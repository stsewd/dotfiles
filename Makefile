install:
	@echo Updating current packages
	sudo dnf up --refresh -y

	@echo Installing core packages
	sudo dnf install -y \
		openssl	\
		openssh-askpass \
		zsh \
		encfs \
		ripgrep \
		fd-find \
		hub \
		direnv \
		bat \
		fzf \
		jq \
		httpie \
		tealdeer \
		tmate \
		gh \
		nmap \
		seahorse \
		pam_yubico \
		git-delta \
		rclone

	# SSH passphrase prompt.
	sudo dnf install -y ksshaskpass

	# ExifTool to remove metadata from files/images.
	sudo dnf install -y \
		perl-Image-ExifTool \
		ImageMagick

	# Languages
	sudo dnf install -y \
		nodejs \
		golang \
		golang-x-tools-gopls \
		ruby \
		ruby-devel \
		clang \
		clang-tools-extra

	# SELinux troubleshooting.
	sudo dnf install -y setroubleshoot
	# Clipboard provider for Neovim.
	sudo dnf install -y wl-clipboard
	# Image to ASCII converter (used by Neovim).
	sudo dnf install -y chafa

	# Bash LSP dependencies.
	sudo dnf install -y shellcheck shfmt
	
	@echo Installing rpmfusion repos
	sudo dnf install -y \
	  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$$(rpm -E %fedora).noarch.rpm \
	  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$$(rpm -E %fedora).noarch.rpm

	@echo Installing additional apps from rpmfusion
	sudo dnf install -y \
		gnome-tweak-tool \
		gnome-extensions-app \
		qbittorrent \
		gnome-shell-theme-flat-remix \
		flat-remix-theme \
		vlc

	# Codecs
	sudo dnf install -y libavcodec-freeworld

	@echo Installing Proton VPN
	./scripts/protonvpn.sh

	@echo Installing flatpak apps
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install -y flathub com.spotify.Client
	flatpak install -y flathub org.kde.krita
	flatpak install -y flathub org.gimp.GIMP
	flatpak install -y flathub com.discordapp.Discord
	flatpak install -y flathub com.calibre_ebook.calibre
	flatpak install -y flathub org.chromium.Chromium

	@echo Install fonts
	./scripts/fonts.sh

	@echo Setup ssh-agent
	./scripts/ssh.sh

	@echo Install kitty
	./scripts/kitty.sh

	@echo Install other apps
	./scripts/docker.sh
	./scripts/nvim.sh --no-backup
	./scripts/rust.sh
	./scripts/node.sh
	./scripts/uv.sh
	./scripts/zsh.sh
	./scripts/luals.sh
	./scripts/marksman.sh

	@echo Installing ruby on rails
	gem install rails

	@echo Installing ruby LSP
	gem install solargraph

# Should be called after make install, in a fresh shell.
# Can also be called to update packages.
update:
	@echo Updating uv
	uv self update
	uv tool upgrade --all

	@echo Updating rust packages
	cargo install stylua

	@echo Updating node packages
	npm update -g

	@echo Updating ruby gems
	gem update --system
	gem update

	@echo Updating zsh
	# https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#how-do-i-update-oh-my-zsh
	$(ZSH)/tools/upgrade.sh

	@echo Updating tldr
	tldr --update

	@echo Updating rust
	rustup self update
	rustup component add rust-analyzer
	rustup update

	@echo Updating Neovim
	./scripts/nvim.sh

	@echo Updating kitty
	./scripts/kitty.sh

	@echo Updating flatpak apps
	flatpak update -y

	@echo Updating gh extensions
	gh extension upgrade --all

symlinks:
	ln -sf `pwd`/gitconfig ~/.gitconfig
	ln -sf `pwd`/gitignore ~/.gitignore
	ln -sf `pwd`/pypirc ~/.pypirc
	ln -sf `pwd`/tmux.conf ~/.tmux.conf
	ln -sf `pwd`/tmate.conf ~/.tmate.conf
	ln -sf `pwd`/zshrc ~/.zshrc
	mkdir -p ~/.ssh/
	ln -sf `pwd`/ssh.config ~/.ssh/config
	ln -sf `pwd`/config/gdb/ ~/.config/
	ln -sf `pwd`/config/nvim/ ~/.config/
	ln -sf `pwd`/config/bat/ ~/.config/
	ln -sf `pwd`/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
	mkdir -p ~/.gnupg/
	ln -sf `pwd`/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
	rm -rf ~/.local/share/nautilus/scripts/
	ln -sf `pwd`/local/share/nautilus/scripts/ ~/.local/share/nautilus/

.PHONY: install symlinks update
