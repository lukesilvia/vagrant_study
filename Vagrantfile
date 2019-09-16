# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "512"
  end

  config.vm.define "redis" do |redis|
    redis.vm.network "private_network", ip: "192.168.33.10"

    redis.vm.provision :shell, path: "provisioning/redis.sh"
  end
end
