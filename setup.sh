echo "Provision virtual machine..."

echo "Install git"
	sudo apt install git > dev/null 2>&1

echo "shell setting"
	wget -O - https://raw.github.com/gyuha/settings/master/bootstrap.sh | bash > /dev/null 2>&1
	
echo "Updating Packages"
	sudo apt-get update > /dev/null 2>&1
	
echo "Install default package"
	sudo add-apt-repository universe > /dev/null 2>&1
	sudo apt install -y cronolog vim exuberant-ctags git build-essential g++ curl \
		libssl-dev expect tmux gcc make autoconf libc-dev pkg-config  > /dev/null 2>&1
	sudo apt install -y libmcrypt-dev > /dev/null 2>&1

echo "Installing Nginx"
	sudo apt-get install nginx -y > /dev/null 2>&1
