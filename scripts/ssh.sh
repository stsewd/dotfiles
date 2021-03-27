# Setup ssh-agent at login.
# You may need to disable the gnome-keyring daemon
# https://wiki.archlinux.org/index.php/GNOME/Keyring#Disable_keyring_daemon_components.
TARGET_DIR=~/.config/systemd/user
if [[ ! -d "$TARGET_DIR" ]]; then
  mkdir -p $TARGET_DIR
fi

ln -sf ~/dotfiles/config/systemd/user/ssh-agent.service $TARGET_DIR/ssh-agent.service
systemctl --user enable ssh-agent
systemctl --user start ssh-agent
