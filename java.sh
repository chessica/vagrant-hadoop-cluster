#! /usr/bin/env bash
echo "Installing java 7"  
sudo apt-get install -y python-software-properties  
sudo add-apt-repository -y ppa:webupd8team/java  
sudo apt-get update

# Enable silent install
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections  
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

sudo apt-get install -y oracle-java7-installer

# Not always necessary, but just in case...
sudo update-java-alternatives -s java-7-oracle
 
echo "Java 7 installation finished"