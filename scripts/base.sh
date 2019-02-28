install_title() {
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "${1}"
	echo "-------------------------------------------------------------------------"
}

echo ""
echo "########################################"
echo "#     Provision virtual machine...     #"
echo "########################################"
echo ""

# 우분투 레포지트리를 다음의 미러링 서버로 변경 -> 속도 차이가 많이 남..
sudo sed -i "s/archive.ubuntu.com/ftp.daumkakao.com/" /etc/apt/sources.list

install_title "Install git"
	sudo apt-get install git
	
install_title "shell setting"
	wget -q -O - https://raw.github.com/gyuha/settings/master/bootstrap.sh | bash
	
install_title "Updating Packages"
	sudo apt-get update -y

install_title "Install default package"
	sudo add-apt-repository universe
	sudo apt-get install -y cronolog vim exuberant-ctags git build-essential g++ curl \
		libssl-dev expect tmux gcc make autoconf libc-dev pkg-config libmcrypt-dev

install_title "Install node.js"
	sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
	sudo apt-get install -y nodejs
	mkdir ~/.npm-global
	npm config set prefix '~/.npm-global'
	echo "export PATH=~/.npm-global/bin:\$PATH" >> ~/.profile
	npm install -g yarn pm2

