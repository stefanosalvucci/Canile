# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |v|
      v.memory = 1024
  end

  config.vm.define "postgres" do |postgres|
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


  config.vm.define "web" do |web|
    web.vm.network "forwarded_port", guest: 22, host: 2222, id: 'ssh', auto_correct: true
    web.vm.network "private_network", ip: "10.11.1.201", virtualbox__intnet: true
    web.ssh.forward_agent = true


    web.vm.box = "leopard/rwtrusty64"
    web.vm.provision "shell",
      inline: "sudo apt-get install -y nodejs;
                export RAILS_ENV=production;
                if [ -f /vagrant/tmp/pids/server.pid ]
                  then
                    sudo kill -INT $(cat /vagrant/tmp/pids/server.pid);
                fi
                cd /vagrant;
                bundle;
                rake db:schema:load;
                rake db:seed;
                export SECRET_KEY_BASE=f1767d05124aefbd239579120ff3f7ebfe76c310bb46aad4395dec5afb6d77acd9ca153e3551388413c39d6dfeb5513f5e0523c57a89642f20bf6906084f3e32;
                rails s -b 0.0.0.0 -d"

  end



end
