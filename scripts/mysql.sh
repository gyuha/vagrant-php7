MYSQL_DBNAME=$1
MYSQL_ID=$2
MYSQL_PASSWORD=$3

install_title() {
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "${1}"
	echo "-------------------------------------------------------------------------"
}

install_title "Install MySQL"

sudo apt-get install -y mysql-server

# Connect Setting
sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# User and db setting
sudo mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DBNAME};"
sudo mysql -e "use mysql;INSERT INTO user (User,Host,authentication_string,ssl_cipher,x509_issuer,x509_subject) VALUES('${MYSQL_ID}','%',PASSWORD('${MYSQL_PASSWORD}'),'','','');"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ID}'@'%' with grant option;"
sudo mysql -e "UPDATE user SET plugin='mysql_native_password' WHERE User='${MYSQL_ID}';"

sudo service mysql restart