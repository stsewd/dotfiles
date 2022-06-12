curl -fsSL https://get.docker.com | bash
# sudo dnf install -y moby-engine docker-compose
# sudo groupadd docker
# sudo usermod -aG docker $USER

# Change cgroups.
# Isn't needed for the current version of docker,
# but it's needed for gvisor.
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
