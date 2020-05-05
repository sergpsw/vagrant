USERNAME=user
PASSWD=password

#!/bin/bash

set -e

if [[ $USERNAME && $PASSWD ]]
  then
	apt-get update
	apt-get install openjdk-8-jre -y
	wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
	sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
	apt-get update
	apt-get install jenkins -y

	mkdir /var/lib/jenkins/init.groovy.d
	cp -f /var/www/vagrant/basic-security.groovy /var/lib/jenkins/init.groovy.d/basic-security.groovy
	cp -f /var/www/vagrant/jenkins.txt /etc/default/jenkins
	cp -Rf /var/www/vagrant/jenkins/* /var/lib/jenkins

	service jenkins restart

	sleep 50 | sudo rm /var/lib/jenkins/init.groovy.d/basic-security.groovy
	wget 192.168.88.21:8080/jnlpJars/jenkins-cli.jar

	DEFPASS=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)

	cp -R /var/www/vagrant/.ssh/* /home/vagrant/.ssh
	chown -R vagrant:vagrant /home/vagrant/.ssh
	cp -Rf /var/www/vagrant/myproject /home/vagrant
	chown -R vagrant:vagrant /home/vagrant/myproject

	echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("'$USERNAME'", "'$PASSWD'")' | java -jar jenkins-cli.jar -auth admin:$DEFPASS -s http://192.168.88.21:8080/ groovy =	

	java -jar jenkins-cli.jar -auth $USERNAME:$PASSWD -s http://192.168.88.21:8080/ -webSocket install-plugin git
	java -jar jenkins-cli.jar -auth $USERNAME:$PASSWD -s http://192.168.88.21:8080/ -webSocket install-plugin publish-over-ssh

	java -jar jenkins-cli.jar -auth $USERNAME:$PASSWD -s http://192.168.88.21:8080 create-job MyJob1_cli < /var/www/vagrant/myjob1.xml

	service jenkins restart

else
  echo "NO username or password!"
  exit 1
fi
