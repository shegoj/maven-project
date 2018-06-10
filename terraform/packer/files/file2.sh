
#!/bin/bash -e
echo "### STARTING FILE 2###"
"[Timer]
Persistent=false" >> /etc/systemd/system/apt-daily.timer.d/apt-daily.timer.conf
sleep 5
sudo apt-get -y update
sudo sh -c 'echo "net.ipv4.conf.all.route_localnet = 1" >> /etc/sysctl.conf'
sudo sysctl -p /etc/sysctl.conf
sudo iptables -t nat -A PREROUTING -p tcp -d 169.254.170.2 --dport 80 -j DNAT --to-destination 127.0.0.1:51679
sudo iptables -t nat -A OUTPUT -d 169.254.170.2 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 51679
sudo mkdir /etc/iptables
sudo sh -c 'iptables-save > /etc/iptables/rules.v4'
sudo mkdir -p /etc/ecs
sudo cp /tmp/ecs.config /etc/ecs/
sudo mkdir -p /var/log/ecs /var/lib/ecs/data
sleep 5
echo "### END OF FILE 2 ###"
sleep 5