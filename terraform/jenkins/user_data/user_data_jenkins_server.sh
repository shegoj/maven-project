#!/bin/bash

# Update apt-get repo
sudo apt-get update

# Install NFS client required packages
echo "Installing NFS client required packages"
sudo apt-get -y install nfs-common
#bind-utils

# Create EFS mount mount point
echo "Creating the EFS mount point"
cd /; sudo mkdir ${efs_mountpoint}

# Wait for EFS DNS to propagate
echo "Checking to see if EFS DNS is ready"
nslookup ${efs_filesystem_id}.efs.${aws_region}.amazonaws.com 
while [ $? -ne 0 ] 
do 
  sleep 30 
  echo "Waiting for EFS dns to propagate" 
  nslookup ${efs_filesystem_id}.efs.${aws_region}.amazonaws.com 
done

# Check to see if EFS is already mounted
echo "Checking to see if EFS is already mounted"
if grep -qs ${efs_filesystem_id}; then
  echo "NFS mount ${efs_filesystem_id}.efs.${aws_region}.amazonaws.com already exists. No need to mount"
else
  sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${efs_filesystem_id}.efs.${aws_region}.amazonaws.com:/ ${efs_mountpoint}
fi

# Check for correct mount point directory ownership
echo "Setting mount point ownership"
sudo chown ${efs_mountpoint_owner} ${efs_mountpoint} 

# Check if /etc/fstab has been modified
echo "Modifying /etc/fstab, if necessary"
cat /etc/fstab | grep "${efs_filesystem_id}"
if [ $? -eq 0 ]; then
  sudo echo "NFS mount ${efs_filesystem_id}.efs.${aws_region}.amazonaws.com already exists. No need to modify /etc/fstab"
else
  sudo echo "${efs_filesystem_id}.efs.${aws_region}.amazonaws.com:/ ${efs_mountpoint} nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 0 0" >> /etc/fstab
fi

# Add instance to the ECS cluster
#echo "Adding instance to the ECS cluster"
echo "ECS_CLUSTER=${ecs_cluster_name}" >> /etc/ecs/ecs.config

# Restart ECS and Docker
echo "Restarting ECS and Docker"
#sudo stop ecs
#sudo service docker restart
#sudo start ecs 


# update ca-certs
sudo update-ca-certificates -f
sudo /var/lib/dpkg/info/ca-certificates-java.postinst configure

sudo iptables -I INPUT 1 -p tcp --dport 8443 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 8080 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 443 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT


sudo iptables-save > /etc/default/iptables
sudo sh -c "iptables-save > /etc/iptables.rules"
sudo apt-get install iptables-persistent -y









