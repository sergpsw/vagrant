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

    web2.vm.synced_folder "./", "/var/www/vagrant", type: "rsync"

    web2.vm.provision "shell", path: "script.sh"
    
    web2.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook-nginx.yml"
    end
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

    web1.vm.synced_folder "./", "/var/www/vagrant", type: "rsync"

    web1.vm.provision "shell", path: "script.sh"
    
    web1.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook-jenkins.yml"
    end
  end

end
