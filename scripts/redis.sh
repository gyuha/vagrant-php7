install_title() {
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "${1}"
	echo "-------------------------------------------------------------------------"
}

install_title "Install redis"
	sudo apt-get install -y redis redis-server redis-tools
	sudo sed -i "s/^bind 127.0.0.1 ::1/bind 0.0.0.0 ::1/" /etc/redis/redis.conf
	sudo sed -i "s/^protected-mode yes/protected-mode no/" /etc/redis/redis.conf
	sudo service redis-server restart