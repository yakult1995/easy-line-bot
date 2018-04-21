if [ ! -e /cert/DOMAIN_NAME/fullchain1.pem ]; then
	/usr/local/certbot/certbot-auto certonly --standalone -d DOMAIN_NAME -m USER_MAIL --agree-tos -n
	cp -r /etc/letsencrypt/archive/* /cert/
fi
nginx
uwsgi --ini /uwsgi.ini
