#!/bin/bash

# Variables
name="NGNIX & PHP 8 INSTALLATION"
author="Benedikt Fischer"
# Colors
RESET="\e[0m"
BOLD="\e[1m"
DIM="\e[2m"
ITALIC="\e[3m"
UNDERLINED="\e[4m"
BLINK="\e[5m"
INVERTED="\e[7m"
CROSSED="\e[9m"
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
LIGHT_GRAY="\e[37m"
DARK_GRAY="\e[90m"
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_YELLOW="\e[93m"
LIGHT_BLUE="\e[94m"
LIGHT_MAGENTA="\e[95m"
LIGHT_CYAN="\e[96m"
WHITE="\e[97m"


# Code
clear
echo -e "*********************************************************"
echo -e ""
echo -e "$name - Coded by $MAGENTA$author$RESET"
echo -e ""
echo -e "*********************************************************"

if (( $EUID != 0 )); then
    echo -e "$RED$DIM Please run as root $RESET"
else
echo -e ""
echo -e "You're root, nice!"

# Paste in Code HERE!
apt update && apt upgrade -y

# INSTALL NGINX & PHP 8 with all modules
apt install nginx -y
apt install software-properties-common -y
echo -ne '\n' | add-apt-repository ppa:ondrej/php    
apt update && apt upgrade -y 
apt install php8.0-fpm -y 
apt install php8.0-bcmath php8.0-bz2 php8.0-cgi php8.0-cli php8.0-common php8.0-curl php8.0-dba php8.0-dev php8.0-enchant php8.0-fpm php8.0-gd php8.0-gmp php8.0-imap php8.0-interbase php8.0-intl php8.0-ldap php8.0-mbstring php8.0-mysql php8.0-odbc php8.0-opcache php8.0-pgsql php8.0-phpdbg php8.0-pspell php8.0-readline php8.0-snmp php8.0-soap php8.0-sqlite3 php8.0-sybase php8.0-tidy php8.0-xml php8.0-xsl php8.0-zip nginx -y 

# Make web directory in /var/www/vhosts/default/
mkdir /var/www/vhosts/
mkdir /var/www/vhosts/default/
echo "<?php phpinfo(); ?>" > /var/www/vhosts/default/info.php
cat <<EOF >/var/www/vhosts/default/bnf.html
<h1>by Benedikt Fischer</h1>
EOF
cd

# Make nginx default config
rm /etc/nginx/sites-available/default
rm /etc/nginx/sites-enabled/default
#cd /etc/nginx/sites-available/

cat <<EOF >/etc/nginx/sites-available/default
#by Benedikt Fischer
server {
    listen 80;
    root /var/www/vhosts/default;
    index index.php index.html index.htm home.html bnf.html;
    server_name _;

    #location / {
    #    try_files $uri $uri/ =404;
    #}

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
    }
}
EOF
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Restart services 
service nginx restart
service php8.0-fpm restart

# Output everything
clear
echo -e ""
echo -e "NGINX"
nginx -v
nginx -t
echo -e ""
echo -e "PHP"
php -v
echo -e ""
echo -e "FINISHED"
fi

