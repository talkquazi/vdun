# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Tells vagrant to build the image based on the Dockerfile found in
  # the same directory as this Vagrantfile.
  config.vm.define "nodejs" do |v|
    v.vm.provider "docker" do |d|
      d.build_dir = "."
      d.ports = ['80:80']
      d.vagrant_vagrantfile = "./Vagrantfile.proxy"
    end
  end

  config.vm.network :forwarded_port, host: 80, guest: 80
end
