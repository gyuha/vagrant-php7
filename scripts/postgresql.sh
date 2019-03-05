POSTGRESQL_DBNAME=$1
POSTGRESQL_ID=$2
POSTGRESQL_PASSWORD=$3

install_title() {
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "${1}"
	echo "-------------------------------------------------------------------------"
}

sudo apt install -y postgresql
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '0.0.0.0'/g" /etc/postgresql/10/main/postgresql.conf
sudo sed -i "s/127.0.0.1\/32/127.0.0.1\/0/g" /etc/postgresql/10/main/pg_hba.conf
sudo service postgresql restart

sudo -u postgres bash -c "psql -c \"CREATE ROLE ${POSTGRESQL_ID} WITH SUPERUSER CREATEDB CREATEROLE LOGIN ENCRYPTED PASSWORD '${POSTGRESQL_PASSWORD}';\""
sudo -u postgres createdb $POSTGRESQL_DBNAME
# sudo -u postgres bash -c "psql -c \"grant all privileges on database ${POSTGRESQL_DBNAME} to ${POSTGRESQL_ID};\""
