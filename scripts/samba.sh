install_title() {
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "${1}"
	echo "-------------------------------------------------------------------------"
}

install_title "Samba Config - ${2}"

sudo apt -y install samba
mkdir -p $2
chmod 777 $2

block="
[${1}]
   path = ${2}
   writable = yes
   guest ok = yes
   guest only = yes
   create mode = 0777
   directory mode = 0777
"

sudo echo "$block" | sudo tee -a /etc/samba/smb.conf

sudo service smbd restart
sudo service nmbd restart