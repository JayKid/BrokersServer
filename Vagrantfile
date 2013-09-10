# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.synced_folder "code", "/vagrant"
  config.vm.synced_folder "code/api", "/var/www/api"

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  
  config.vm.define :api do |api_config|
    api_config.vm.box = "precise32"
    api_config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    api_config.vm.host_name = "api"
    api_config.vm.network "private_network", ip: "10.10.10.10"
    api_config.vm.network "forwarded_port", guest: 22, host: 2211
    api_config.vm.network "forwarded_port", guest: 80, host: 8010

    api_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path     = "roles"
      chef.add_role "api"
    end
  end

  config.vm.define :db do |db_config|
    db_config.vm.box = "precise32"
    db_config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    db_config.vm.host_name = "db"                                                                                                            
    db_config.vm.network "private_network", ip: "10.10.10.11"
    db_config.vm.network "forwarded_port", guest: 22, host: 2212

    db_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.roles_path     = "roles"
      chef.add_role "db"
    end
  end

end


