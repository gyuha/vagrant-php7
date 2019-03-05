install_title() {
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "${1}"
	echo "-------------------------------------------------------------------------"
}

install_title "Install Nginx"

block="server {
    listen   80;

    root ${1};
    index index.php index.html index.htm;

    # Make site accessible from http://localhost/
    server_name localhost;

    autoindex on;
    disable_symlinks off;
    index index.php;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
        location = /index.php {
            fastcgi_pass unix:/run/php/php7.2-fpm.sock;
            fastcgi_param  SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
            include fastcgi_params;
        }
    }

    location ~ \.php\$ {
        return 444;
    }

# deny access to .htaccess files, if Apache's document root
# concurs with nginx's one
    location ~ /\.ht {
            deny all;
    }

}
"

sudo apt-get install -y nginx

#sudo bash -c "echo \"$block\" > \"/etc/nginx/sites-available/dev\""
sudo echo "$block" | sudo tee /etc/nginx/sites-available/dev
sudo ln -snf /etc/nginx/sites-available/dev /etc/nginx/sites-enabled/default
sudo service nginx restart