
#!/bin/bash

set -e

apt-get update
apt-get install nginx -y

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfl5+lTdkLf3mEZGZ25L53xxz4/f9CxVUL9mtDwjmZwv0e7bJTBQcwGXqFnZtfHimHKgX/CaABs65BDoETqEcIt7QBDJZyLsnA/hG6n/2J4faTKcmY2bH+eba4au0d8x+/F8JKDTY5Bhbr7TrTncARZsNllNtGeHk7QQdnzezcxNZ0NN1kRfMZJ7dWz39mr0JeMb7qfSLNF9T9PYO1E5ZyWEBwLCA5Jz4dc7/3K5GcW2MfKeDu/Ci+CK5txnN0dzHMWhuTeU9GzW8mQgJlf+x5T7xn1QLT8CGG/7DFBMjZmXsAekMulSq0Xiz3q9ndcHvRLDiJDXqoWTVksPZ+TWlJ vagrant@webserver1" >> /home/vagrant/.ssh/authorized_keys

chown -R vagrant:vagrant /var/www/html/
