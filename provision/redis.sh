install_title() {
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "${1}"
	echo "-------------------------------------------------------------------------"
}

install_title "Install redis"
	sudo apt-get install -y redis redis-server redis-tools