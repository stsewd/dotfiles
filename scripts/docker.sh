sudo dnf install -y moby-engine
sudo groupadd docker
sudo usermod -aG docker $USER
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
