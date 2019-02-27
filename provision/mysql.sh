MYSQL_DBNAME=dbname
MYSQL_ID=devuser
MYSQL_PASSWORD=devpassword

install_title() {
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "${1}"
}

install_title "Install MySQL"
	sudo apt install -y mysql-server
	sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

	sudo mysql -e "use mysql;INSERT INTO user (User,Host,authentication_string,ssl_cipher,x509_issuer,x509_subject) VALUES('${MYSQL_ID}','%',PASSWORD('${MYSQL_PASSWORD}'),'','','');"
	sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ID}'@'%' with grant option;"
	sudo mysql -e "UPDATE user SET plugin='mysql_native_password' WHERE User='${MYSQL_ID}';"
	sudo service mysql restart