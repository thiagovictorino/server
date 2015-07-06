#!/bin/bash

reset
clear

export LANGUAGE=en_US.UTF-8

export LANG=en_US.UTF-8

export LC_ALL=en_US.UTF-8

locale-gen en_US.UTF-8

dpkg-reconfigure locales

echo "Installing some packages..."

sudo apt-get update -y

sudo apt-get install debian-keyring debian-archive-keyring

sudo apt-get update -y

sudo su -c "echo 'America/Sao_Paulo' > /etc/timezone" -s /bin/bash root
sudo dpkg-reconfigure --frontend noninteractive tzdata 

sudo aptitude install apache2 php5 php5-intl mongodb vim php5-curl memcached php5-memcached -y

clear
reset

echo "Configuring the virtual host..."

wget http://images.pontual.taxi.br:8081/web.dev.conf

sudo mv web.dev.conf /etc/apache2/sites-available/

sudo ln -s /etc/apache2/sites-available/web.dev.conf /etc/apache2/sites-enabled/web.dev.conf

sudo find /etc/php5/apache2/ -type f -print0 | sudo xargs -0 sed -i "s/short_open_tag = On/short_open_tag = Off/g"

echo "The virtual host created is web.dev.conf"

echo "Installing Postgresql"

echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main" > /etc/apt/sources.list.d/pgdg.list

sudo wget  https://www.postgresql.org/media/keys/ACCC4CF8.asc

sudo apt-key add ACCC4CF8.asc

sudo apt-get update -y

sudo aptitude install postgresql-9.4 postgresql-contrib postgis -y

sudo su -c "psql -c \"CREATE USER powertaxi WITH PASSWORD '010powertaxi123'\"" -s /bin/bash postgres

sudo find /etc/postgresql/9.4/main/ -type f -print0 | sudo xargs -0 sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g"


sudo su -c "echo 'host    all             all             192.168.1.0/24          trust' >> /etc/postgresql/9.4/main/pg_hba.conf" -s /bin/bash postgres
sudo su -c "echo 'host    all             all             10.0.2.0/8              trust' >> /etc/postgresql/9.4/main/pg_hba.conf" -s /bin/bash postgres

sudo service postgresql restart

echo "Configuring Mongo module"

sudo aptitude install php5-pgsql php5-dev php5-cli php-pear -y

sudo pecl install mongo

echo echo "extension=mongo.so" > /etc/php5/mods-available/mongo.ini

sudo find /etc/mongodb.conf -type f -print0 | sudo xargs -0 sed -i "s/bind_ip = 127.0.0.1/#bind_ip = 127.0.0.1/g"

sudo service mongodb restart

sudo a2enmod rewrite
sudo service apache2 restart

echo "******** PROCESS FINIHED! ********"
