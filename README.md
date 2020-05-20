
1. Download and install VirtualBox. Download and install Vagrant. Download and install Ansible. 
 - https://www.virtualbox.org/wiki/Linux_Downloads
 - https://www.vagrantup.com/intro/getting-started
 - https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

2. Clone repo "git@github.com:sergpsw/vagrant.git" to your machine in directory /var/www/

3. In file '/var/www/vagrant/ansible-role-jenkins-master/defaults/main.yml' change USERNAME (row 34) and PASSWORD (row 36). Save and close this file.

4. Open the terminal in this folder (/var/www/vagrant) and enter commands:
  - 'ansible-galaxy install geerlingguy.jenkins'
  - 'vagrant up'

5. Wait until the virtual machine starts up. Later:
 - Enter 192.168.88.21:8080 in the address bar of the browser to open the Jenkins interface. 
 - Enter 192.168.88.22 in the address bar of the browser to open your HTML page.


