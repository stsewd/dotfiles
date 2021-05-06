sudo dnf install -y moby-engine docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER

# Daemon settings
DOCKER_DIR=/etc/docker
if [[ ! -d "DOCKER_DIR" ]]; then
  sudo mkdir -p $DOCKER_DIR
fi
sudo ln -sf ~/dotfiles/daemon.json $DOCKER_DIR/daemon.json

# Change cgroups
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
