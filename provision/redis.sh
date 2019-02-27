install_title() {
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "${1}"
}

install_title "Install redis"
	sudo apt install -y redis redis-server redis-tools