sudo dnf install -y moby-engine docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER

# Change cgroups and networking
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
