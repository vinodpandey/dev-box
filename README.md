dev-box
=======

Dev box using vagrant

What it includes
----------------
httpd + mod_wsgi
mysql + phpmyadmin
python2.7 + pip-2.7 + virtualenv-2.7
vim-7.3 with python2.7.3
git

in host machine:
update hosts file: 
www.example.com 192.168.33.10

Access:
www.example.com
www.example.com/phpmyadmin - root/root




Prerequisite
-------------
Virtual box: 4.2.8 (https://www.virtualbox.org/wiki/Download_Old_Builds)  
Vagrant: 1.2.2 (http://downloads.vagrantup.com/)

First time
-----------
git clone git@github.com:vinodpandey/dev-box.git  
vagrant up

Suspend/Resume VM
-----------------
vagrant suspend  
vagrant resume  

Shutdown/destroy
----------------
vagrant halt  
vagrant destroy  




