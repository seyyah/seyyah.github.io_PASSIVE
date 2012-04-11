---
layout: post
title: nginx - fastcgi - php
---

Ortam Debian squeeze

	root@squ:~# cat /etc/*version
	squeeze/sid


DRAFT

1. apche2 yi devre dışı bırak

		$ sudo update-rc.d -f apache2 remove
		$ sudo /etc/init.d/apache2 stop

2. nginx i kur

		$ sudo apt-get install nginx
		$ sudo /etc/init.d/nginx start
		Starting nginx: nginx.

Test edelim,

	$ netstat -pantu | grep :80
	tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      20429/nginx

veya

	$ sudo netstat --tcp --listening --programs | grep www
	tcp        0      0 *:www                   *:*                     LISTEN      23394/nginx

Ayar,

1. [default](http://gist.github.com/raw/477380/faed20a2fa6369449fed34e117b36e2f5d2ba1d4/default) ayar dosyasını temin et
2. `install -m 644 default /etc/nginx/sites-available/default`

Var sayılan web klasörü izinlerini ayarla,

	chown -R www-data:www-data /var/www/

log dosyaları burada: `/var/log/nginx/[localhost]access|error.log`

## php5 + cgi

	$ apt-get install mysql-server mysql-client
	$ apt-get install php5-cgi

	$ sudo apt-get install php5 php5-cgi
	...
	Creating config file /etc/php5/cgi/php.ini with new version

arkada çalışan php-cgi prosesi var mı?

	$ sudo ps ax | grep cgi
	2304 ?        S      0:00 /usr/bin/php-cgi
	...

## supervisor

Kurulum 

	apt-get install supervisor

Ayar

1. [php.conf](http://gist.github.com/raw/477351/896fb3bba798d6d9531cba257c30a7af29f2b5aa/php.conf) dosyasını indir

2. `install -m 644 php.conf /etc/supervisor/conf.d/php.conf`

Açılışta başlasın: `$ sudo update-rc.d supervisor defaults`

Başlatalım,

	$ sudo /etc/init.d/supervisor start
	Starting supervisor: supervisord.

Şöyle de test ettim,

	$ sudo ps ax | grep supervisor
	12411 ?        Ss     0:00 /usr/bin/python /usr/bin/supervisord
	$ netstat --listening | grep supervisor
	unix  2      [ ACC ]     STREAM     LISTENING     25417    /var/run/supervisor.sock.12410

log dosyası burada: `/var/log/supervisor/supervisord.log`


## Kaynaklar

1. <http://paddyland.serveblog.net/article/13>
2. <http://chrisarndt.de/projects/cblog/supervisor2-config.tgz>
3. <http://www.vps.net/forum/public-forums/tutorials-and-how-tos/1102-how-to-spawn-php-with-supervisord-for-nginx-on-debian>
4. <http://serverfault.com/questions/96499/how-to-automatically-start-supervisord-on-linux-ubuntu>
5. <http://articles.slicehost.com/2009/3/5/ubuntu-intrepid-nginx-configuration>
6. <http://till.klampaeckel.de/blog/archives/51-Ubuntu-nginx+php-cgi-on-a-socket.html>

## ???

	$ # diger paketler
	$ apt-get install php5-mysql php5-curl php5-gd php5-idn php-pear \
	  php5-imagick php5-imap php5-common php5-mcrypt php5-memcache   \
	  php5-mhash php5-ming php5-ps php5-pspell php5-recode php5-snmp \
	  php5-sqlite php5-tidy php5-xmlrpc php5-xsl
