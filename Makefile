install:
	dnf install \
		ctags \
		wmctrl \
		the_silver_searcher \
		direnv \
		bat \
		jq
	# Don't run ctags on $HOME
	touch ~/.notags

symlinks:
	ln -s -f `pwd`/notags ~/.notags
	ln -s -f `pwd`/ctags ~/.ctags
	ln -s -f `pwd`/gitconfig ~/.gitconfig
	ln -s -f `pwd`/gitignore ~/.gitignore
	ln -s -f `pwd`/pypirc ~/.pypirc
	ln -s -f `pwd`/tmux.conf ~/.tmux.conf
	ln -s -f `pwd`/tmate.conf ~/.tmate.conf
	ln -s -f `pwd`/zshrc ~/.zshrc
	ln -s -f `pwd`/config/nvim ~/.config/nvim
	ln -s -f `pwd`/config/bat ~/.config/bat
