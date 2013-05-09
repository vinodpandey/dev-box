
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

sudo yum -y groupinstall 'Development Tools'
sudo yum -y  install openssl-devel zlib ncurses ncurses-devel

# make python2.7 as default python in bash profile for vim setup
mkdir -p /home/vagrant/bin
ln -sfn /usr/local/bin/python2.7 /home/vagrant/bin/python
if grep -q "export PATH=/home/vagrant/bin" "/home/vagrant/.bashrc"; then
  echo "bin path already exist"
else
  echo "export PATH=/home/vagrant/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin" >> /home/vagrant/.bashrc 
  source /home/vagrant/.bashrc
fi

if [[ $(vim --version | grep IMproved) != *7.3* ]]; then
 echo "Installing vim with python support" 
 wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
 tar jxvf vim-7.3.tar.bz2
 cd vim73
 ./configure --enable-pythoninterp --with-python-config-dir=/usr/local/lib/python2.7/config   --with-features=huge --disable-selinux
 make
 sudo make install
 cd ..
 rm -rf vim73
 rm -rf vim-7.3.tar.bz2
 sudo ln -sfn /usr/local/bin/vim /usr/bin/vim
fi
