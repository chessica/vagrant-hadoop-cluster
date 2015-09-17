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
  
  $provision_script2= <<SCRIPT
    cat >> /home/vagrant/.bashrc << "EOF"
    export JAVA_HOME=/usr/lib/jvm/java-7-oracle
	export HADOOP_INSTALL=/home/vagrant/hadoop-2.7.1
	export PATH=$PATH:$HADOOP_INSTALL/bin
	export PATH=$PATH:$HADOOP_INSTALL/sbin
	export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
	export HADOOP_COMMON_HOME=$HADOOP_INSTALL
	export HADOOP_HDFS_HOME=$HADOOP_INSTALL
	export YARN_HOME=$HADOOP_INSTALL
	export HADOOP_PREFIX=$HADOOP_INSTALL
EOF
SCRIPT
  config.vm.provision :shell, :inline => $provision_script2
  
  config.vm.provision "shell", path: "java.sh"

  config.vm.define :backup do |box|
    box.vm.network :private_network, ip: "10.10.0.51"
    box.vm.host_name = "backup"  
  end
  
  config.vm.define :hadoop1 do |hadoop1_config|
    hadoop1_config.vm.network :private_network, ip: "10.10.0.53"
    hadoop1_config.vm.host_name = "hadoop1"
  end

  
  
   config.vm.define :master do |master_config|
    master_config.vm.provider "virtualbox" do |master_vb|
        master_vb.memory = 2048
    end  
    master_config.vm.network :private_network, ip: "10.10.0.52"
    master_config.vm.host_name = "master"
    master_config.vm.provision "shell", privileged: false, inline: <<-SHELL
      cd /home/vagrant
      wget http://apache.volia.net/tomcat/tomcat-7/v7.0.64/bin/apache-tomcat-7.0.64.tar.gz
      tar xzf apache-tomcat-7.0.64.tar.gz
      mv apache-tomcat-7.0.64 tomcat7
      echo "export CATALINA_HOME=\"/home/vagrant/tomcat7\"" >> ~/.bashrc
      source ~/.bashrc
      mkdir chessica
      mkdir chessica/results
      mkdir chessica/uploaded
      cd ~/hadoop*
      bin/hdfs namenode -format
      sbin/start-dfs.sh
      sbin/start-yarn.sh
    SHELL
  end

end
