#!/usr/bin/env bash
sudo apt-get update >/dev/null 2>&1
echo "Installing MySQL..."
	echo 'mysql-server-5.1 mysql-server/root_password password vagrant' | debconf-set-selections
	echo 'mysql-server-5.1 mysql-server/root_password_again password vagrant' | debconf-set-selections
	apt-get -y install mysql-client mysql-server >/dev/null 2>&1

echo "Installing Apache2..."
	apt-get -y install apache2 >/dev/null 2>&1

echo "Installing PHP5 support..."	 
	apt-get -y install php5 libapache2-mod-php5 php5-mysql >/dev/null 2>&1

echo "Setting Apache..."
	# Enable mod_rewrite	
	a2enmod rewrite >/dev/null 2>&1

	# Add www-data to vagrant group
	usermod -a -G vagrant www-data >/dev/null 2>&1

	# Restart services
	/etc/init.d/apache2 restart >/dev/null 2>&1

echo "Setting Wordpress site..."
  ln -s /vagrant/ /var/www/simply
  mysqladmin create sanboxwordpresssimply -u root --password=vagrant
  /vagrant/tools/restoredatabase.sh