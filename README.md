1. Download and install VirtualBox. Download and install Vagrant.
 - https://www.virtualbox.org/wiki/Linux_Downloads
 - https://www.vagrantup.com/intro/getting-started

2. Clone the repository "git@github.com:sergpsw/vagrant-jenkins.git" to your machine in any folder. Open a terminal in this folder.

3. In file './ansible-role-jenkins-master/defaults/main.yml' default variables are indicated. Change USERNAME and PASSWORD can in row 33 and row 34.

4. Run the command 'vagrant up'. 
   NOTE. You can also set USERNAME and PASSWORD by running the playbook with parameter:
   - ansible-playbook playbook-jenkins.yml -e 'jenkins_admin_username=YOUR_USERNAME jenkins_admin_password=YOUR_PASSWORD'
   The host must be installed ansible!

5. Wait until the virtual machine starts up. Next:
 - Enter 192.168.88.21:8080 in the address bar of the browser to open the Jenkins interface. 
 - Enter 192.168.88.22 in the address bar of the browser to open your HTML page.
