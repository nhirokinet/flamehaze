.PHONY: all install install_daemon_scripts dpkg

all:
	true

install: init.d/flamehaze default/flamehaze flamehaze
	mkdir -p $(DESTDIR)/usr/bin/
	cp ./flamehaze $(DESTDIR)/usr/bin/flamehaze
	
	#cp ./init.d/flamehaze $(DESTDIR)/etc/init.d/flamehaze
	#cp ./default/flamehaze $(DESTDIR)/etc/default/flamehaze
	
	#chmod +x $(DESTDIR)/etc/init.d/flamehaze
	#chmod +x $(DESTDIR)/usr/bin/flamehaze
	
	mkdir -p $(DESTDIR)/etc
	if [ ! -e $(DESTDIR)/etc/flamehaze.ini ]; then cp sample_config.ini $(DESTDIR)/etc/flamehaze.ini; fi
	chmod 660 $(DESTDIR)/etc/flamehaze.ini
	chown root.flamehaze $(DESTDIR)/etc/flamehaze.ini
	
	mkdir -p $(DESTDIR)/var/log
	touch $(DESTDIR)/var/log/flamehaze.log

install_daemon_scripts:
	cp ./init.d/flamehaze $(DESTDIR)/etc/init.d/flamehaze
	cp ./default/flamehaze $(DESTDIR)/etc/default/flamehaze
	
	chmod +x $(DESTDIR)/etc/init.d/flamehaze
	chmod +x $(DESTDIR)/usr/bin/flamehaze

dpkg:
	rm debian/flamehaze -Rf
	rm debian/flamehaze.debhelper.log -f
	fakeroot debian/rules binary
