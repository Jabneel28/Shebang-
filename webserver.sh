#!/bin/bash

#This script does the setup to host a webpage on the server
echo 


echo "######################################################"
echo "Installing packages"
echo "######################################################"
sudo yum install wget httpd unzip -y > /dev/null


echo "######################################################"
echo "Initiating HTTPD service"
echo "######################################################"
sudo systemctl start httpd
sudo systemctl enable httpd


echo "######################################################"
echo "Downloading website template and setup"
echo "######################################################"
mkdir -p /tmp/websetup
cd /tmp/websetup
sudo wget https://www.tooplate.com/zip-templates/2108_dashboard.zip > /dev/null
sudo unzip 2108_dashboard.zip > /dev/null
sudo cp -r 2108_dashboard/* /var/www/html/
sudo systemctl restart httpd


echo "######################################################"
echo "Cleanup"
echo "######################################################"
sudo rm -rf /tmp/websetup/


echo "######################################################"
echo "Status of HTTPD service is:"
echo "######################################################"
sudo systemctl status httpd

