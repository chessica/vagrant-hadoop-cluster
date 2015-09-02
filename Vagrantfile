# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 1024
  end

  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "base-hadoop.pp"
     puppet.module_path = "modules"
  end

  config.vm.define :backup do |box|
    box.vm.network :private_network, ip: "10.10.0.51"
    box.vm.host_name = "backup"  
  end

  config.vm.define :hadoop1 do |hadoop1_config|
    hadoop1_config.vm.network :private_network, ip: "10.10.0.53"
    hadoop1_config.vm.host_name = "hadoop1"
  end

   config.vm.define :master do |master_config|
    master_config.vm.network :private_network, ip: "10.10.0.52"
    master_config.vm.host_name = "master"
  end

end
