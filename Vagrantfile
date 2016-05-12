# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "leopard/rwtrusty64"

  config.vm.network "private_network", ip: "10.11.1.201", virtualbox__intnet: true

  config.vm.provider "virtualbox" do |v|
      v.memory = 1024
  end


  config.vm.define "web" do |web|
    config.vm.network "forwarded_port", guest: 3000, host: 3000
    config.vm.provision "shell" do |s|
      s.inline = "sudo apt-get install -y nodejs"
      s.inline = "cd /vagrant"
      s.inline = "bundle"
      s.inline = "export RAILS_ENV=production"
      s.inline = "rails s -b 0.0.0.0"
    end
  end

  config.vm.define "postgres" do |postgres|
    config.vm.network "forwarded_port", guest: 5432, host: 5432

    # postgres.vm.box = "ubuntu/trusty64"
    # postgres.vm.provision "puppet" do |puppet|
    #   puppet.options = "--verbose --debug"
    #   puppet.manifests_path = "puppet/manifests"
    #   puppet.manifest_file = "init.pp"
    #   puppet.module_path = "/home/mattia/.puppet/code/modules"  #path per moduli puppetlabs
    # end
  end

end
