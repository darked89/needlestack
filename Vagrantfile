# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

	config.vm.box = "ubuntu/trusty64"

	config.vm.provider "virtualbox" do |vb|
		vb.memory = "4096"
		vb.cpus = 2
	end

	config.vm.provision "shell", inline: <<-SHELL
		DEBIAN_FRONTEND=noninteractive apt-get update -y
		DEBIAN_FRONTEND=noninteractive apt-get install -y default-jre
		wget -qO- get.nextflow.io | bash
		chmod 777 nextflow
		ln -s /home/vagrant/nextflow /usr/local/bin/
		curl -sSL https://get.docker.com/ | sh
		usermod -aG docker vagrant
	SHELL

end
