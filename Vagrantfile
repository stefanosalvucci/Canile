# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.network "private_network", ip: "10.11.1.201", virtualbox__intnet: true

  config.vm.provider "virtualbox" do |v|
      v.memory = 1024
  end


  config.vm.define "web" do |web|
    web.vm.network "forwarded_port", guest: 3000, host: 3000
    web.vm.network "forwarded_port", guest: 22, host: 2222, id: 'ssh', auto_correct: true
    web.vm.network "private_network", ip: "10.11.1.201", virtualbox__intnet: true
    web.ssh.forward_agent = true


    web.vm.box = "leopard/rwtrusty64"
    web.vm.provision "shell",
      inline: "sudo apt-get install -y nodejs; cd /vagrant; bundle; RAILS_ENV=production rails s"

    # web.vm.provision "shell" do |s|
    #   s.inline = "sudo apt-get install -y nodejs"
    #   s.inline = "cd /vagrant"
    #   s.inline = "bundle"
    #   s.inline = "export RAILS_ENV=production"
    #   s.inline = "rails s -b 0.0.0.0"
    # end
  end

  config.vm.define "postgres" do |postgres|
    postgres.vm.network "forwarded_port", guest: 5432, host: 5433
    postgres.vm.box = "ubuntu/trusty64"

    postgres.vm.network "forwarded_port", guest: 22, host: 2221, id: 'ssh', auto_correct: true
    postgres.vm.network "private_network", ip: "10.11.1.101", virtualbox__intnet: true
    postgres.ssh.forward_agent = true

    postgres.vm.provision "puppet" do |puppet|
      puppet.options = "--verbose --debug"
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "init.pp"
      puppet.module_path = ENV['PUPPET_PATH']  #path per moduli puppetlabs
    end
  end

end
