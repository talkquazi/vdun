# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "nodejs" do |v|
    v.vm.provider "docker" do |d|
      d.build_dir = "."
      d.ports = ['8080:8080']
  	  d.name = "nodejs"
      d.vagrant_vagrantfile = "./VagrantfileMachine"
    end
  end
end
