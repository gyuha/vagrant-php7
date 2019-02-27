install_title() {
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "${1}"
	echo "-------------------------------------------------------------------------"
}

install_title "Install Nginx"

sudo apt-get install -y nginx

mv /tmp/config /etc/nginx/sites-available/
ln -snf /etc/nginx/sites-available/config /etc/nginx/sites-enabled/default
sudo service nginx restart