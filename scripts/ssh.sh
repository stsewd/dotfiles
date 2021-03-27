TARGET_DIR=~/.config/systemd/
if [[ ! -d "$TARGET_DIR" ]]; then
  mkdir -p $TARGET_DIR
fi

ln -sf ~/dotfiles/config/systemd/user/ssh-agent.service ~/.config/systemd/user/ssh-agent.service
systemctl --user enable ssh-agent
systemctl --user start ssh-agent
