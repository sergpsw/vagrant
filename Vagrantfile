Vagrant.configure("2") do |config|

  config.vm.define "web2" do |web2|
    web2.vm.box = "ubuntu/xenial64"
    web2.vm.hostname = "webserver2"
    web2.vm.network "private_network", ip: "192.168.88.22"
   
    web2.vm.provider "virtualbox" do |vb2|
      vb2.name = "webserv2"
      vb2.cpus = 1
      vb2.memory = "2024"
    end

    web2.vm.synced_folder "/var/www/vagrant", "/var/www/vagrant"
    web2.vm.provision "ansible", playbook: "playbook-web2.yml"
  end

  config.vm.define "web1" do |web1|
    web1.vm.box = "ubuntu/xenial64"
    web1.vm.hostname = "webserver1"
    web1.vm.network "private_network", ip: "192.168.88.21"
   
    web1.vm.provider "virtualbox" do |vb1|
      vb1.name = "webserv1"
      vb1.cpus = 1
      vb1.memory = "2024"
    end

    web1.vm.synced_folder "/var/www/vagrant", "/var/www/vagrant"
    web1.vm.provision "ansible", playbook: "playbook-web1.yml"
  end

end
