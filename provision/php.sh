install_title() {
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "${1}"
	echo "-------------------------------------------------------------------------"
}

install_title "Install PHP"
	sudo apt-get install -y php-fpm php-cli php-common php-curl php-gd php-gmp \
	php-json php-ldap php-mysql php-odbc php-pspell php-readline php-recode \
	php-sqlite3 php-tidy php-xml php-xmlrpc php-bcmath php-bz2 php-enchant \
	php-imap php-interbase php-intl php-mbstring php-phpdbg php-soap php-sybase \
	php-zip php-imagick php-redis php-apcu php-pear php-dev
	sudo pecl install mcrypt-1.0.1
	sudo bash -c "echo extension=/usr/lib/php/20170718/mcrypt.so > /etc/php/7.2/cli/conf.d/mcrypt.ini"
	sudo bash -c "echo extension=/usr/lib/php/20170718/mcrypt.so > /etc/php/7.2/fpm/conf.d/mcrypt.ini"
	php -i | grep "mcrypt"

