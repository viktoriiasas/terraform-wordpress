#!/bin/bash
set -e

# Update and install dependencies
yum update -y
amazon-linux-extras install -y php7.4
yum install -y httpd php php-mysqlnd wget tar -y

# Start and enable Apache
systemctl start httpd
systemctl enable httpd

# Install WordPress
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* .
rm -rf wordpress latest.tar.gz
chown -R apache:apache /var/www/html

# Configure wp-config.php
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/wordpress/" wp-config.php
sed -i "s/username_here/admin/" wp-config.php
sed -i "s/password_here/adminadmin/" wp-config.php
sed -i "s/localhost/mysql.c3k8aomay241.us-east-1.rds.amazonaws.com/" wp-config.php

# Secure config
chmod 640 wp-config.php