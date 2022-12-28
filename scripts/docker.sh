curl -fsSL https://get.docker.com | bash

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Change cgroups.
# Isn't needed for the current version of docker,
# but it's needed for gvisor.
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
