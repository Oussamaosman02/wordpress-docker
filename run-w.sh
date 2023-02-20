#!/bin/bash

# installing mysql
sudo docker run --name wordpressdb -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpress -d mysql
# now installing wordpress
sudo docker run --name wordpress --link wordpressdb:mysql -p 8080:80 -d wordpress

# If you have errors while connecting to the databse in wordpress, 
# you need to connect to mysql image (wordpressdb):
# sudo docker exec -it wordpressdb sh
# Inside the machine we will need to install net-tools for knowing the ip
# yum install net-tools
# when the installation has finished, we run: ifconfig
# this will give us th ip address that goes into the databse host, in wordpress