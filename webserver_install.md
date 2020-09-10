# welcome

## frontend

### dependencies 

Using Ubuntu Server 18.04. See: https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-18-04-quickstart

    sudo ufw app list
    sudo ufw allow OpenSSH
    sudo ufw enable

    sudo apt update
    sudo apt install apache2
    sudo ufw app list
    sudo ufw allow 'Apache'
    sudo ufw status

    sudo systemctl status apache2

    sudo chown -R $USER:$USER /var/www/html

    sudo apt install php libapache2-mod-php
    sudo systemctl restart apache2

To test the server, open the following in a web browser: http://192.168.1.213

## modify site contents

Use this to upload to the website.

    scp site/* mal@192.168.1.213:/var/www/html/

## configuration

    mkdir /var/www/html/jobs
    chmod 777 /var/www/html/jobs

## install text generator

    git clone https://github.com/salesforce/ctrl.git
    cd ctrl
    # follow my readme to install this

    