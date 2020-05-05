Vagrant.configure("2") do |config|

  config.vm.define "node1" do |node1|
    node1.vm.box = "ubuntu/xenial64"
    node1.vm.hostname = "webserver1"
    node1.vm.network "private_network", ip: "192.168.88.21"
   
    node1.vm.provider "virtualbox" do |vb1|
      vb1.name = "webserv1"
      vb1.cpus = 1
      vb1.memory = "1024"
    end

    node1.vm.provision "shell", path: "script1.sh"

    node1.vm.synced_folder "/var/www/vagrant", "/var/www/vagrant"

  end

  config.vm.define "node2" do |node2|
    node2.vm.box = "ubuntu/xenial64"
    node2.vm.hostname = "webserver2"
    node2.vm.network "private_network", ip: "192.168.88.22"
   
    node2.vm.provider "virtualbox" do |vb2|
      vb2.name = "webserv2"
      vb2.cpus = 1
      vb2.memory = "1024"
    end

    node2.vm.provision "shell", path: "script2.sh"
    node2.vm.synced_folder "/var/www/vagrant", "/var/www/vagrant"

  end

end
