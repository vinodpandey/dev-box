# dependency directories
#mkdir -p /var/www/html/www.example.com

# turnoff firewall
sudo /etc/init.d/iptables save
sudo /etc/init.d/iptables stop

# turnoff firewall on boot
sudo chkconfig iptables off

# install python-virtualenv-pip
echo "installing python-virtualenv-pip"
wget --no-check-certificate -O python-virtualenv-pip.sh https://raw.github.com/vinodpandey/bash-scripts/master/python-virtualenv-pip.sh
chmod +x python-virtualenv-pip.sh
./python-virtualenv-pip.sh
rm -rf python-virtualenv-pip.sh


#phpmyadmin
#wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#sudo rpm -Uvh epel-release-6-8.noarch.rpm
#rm -rf epel-release-6-8.noarch.rpm
#sudo yum -y install phpmyadmin
#sudo /etc/init.d/httpd restart
