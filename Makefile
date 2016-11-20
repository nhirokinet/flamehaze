install: init.d/flamehaze default/flamehaze flamehaze
	cp ./init.d/flamehaze /etc/init.d/flamehaze
	cp ./default/flamehaze /etc/default/flamehaze
	
	
	cp ./flamehaze /usr/bin/flamehaze
	
	chmod +x /etc/init.d/flamehaze
	chmod +x /usr/bin/flamehaze
	
	if [ ! -e /etc/flamehaze.ini ]; then cp sample_config.ini /etc/flamehaze.ini; fi
	chmod 600 /etc/flamehaze.ini
	chown flamehaze /etc/flamehaze.ini
	
	touch /var/log/flamehaze.log
	
	systemctl daemon-reload
