# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "leopard/rwtrusty64"

  # config.vm.synced_folder "www/", "/var/www/html", :mount_options => ["dmode=777", "fmode=777"]

  config.vm.define "node" do |node|
      node.vm.hostname = "node"
      node.vm.network "private_network", ip: "10.11.1.201", virtualbox__intnet: true

      node.vm.provider "virtualbox" do |v|
          v.memory = 1024
      end

      node.vm.network "forwarded_port", guest: 3000, host: 8080, id: 'http', auto_correct: true
      # node.ssh.forward_agent = true

  end
  
  config.vm.define "postgres" do |postgres|

  postgres.vm.box = "ubuntu/trusty64"
  
	postgres.vm.provision "puppet" do |puppet|
    		puppet.options = "--verbose --debug"
		puppet.manifests_path = "puppet/manifests"
		puppet.manifest_file = "init.pp"
		puppet.module_path = "/home/mattia/.puppet/code/modules"  #path per moduli puppetlabs
	end
  end
  config.vm.provision "shell",
    inline: "sudo apt-get install -y nodejs; cd /vagrant; bundle; rails s"

end
