curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh
# sudo dnf install -y moby-engine docker-compose
# sudo groupadd docker
# sudo usermod -aG docker $USER

# Change cgroups
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
