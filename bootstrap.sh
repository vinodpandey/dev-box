# turnoff firewall
sudo /etc/init.d/iptables save
sudo /etc/init.d/iptables stop

# turnoff firewall on boot
sudo chkconfig iptables off


