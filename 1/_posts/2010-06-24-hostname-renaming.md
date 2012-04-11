---
layout: post
title: hostname renaming
---

Makine ismimiz `cas` onu `moodle` ile değiştirmek istiyorum. Nasıl olacak?

1. `/etc/hostname` dosyasında `:%s/cas/moodle/gce` değişikliğini yapıyoruz.

2. komut satırında `$ sysctl kernel.hostname=YENI_MAKINE_ISMI` yani `$ sysctl kernel.hostname=moodle` yazıyoruz.

3. `/etc/hosts` dosyasında `:%s/cas/moodle/gce` değişikliğini yapıyoruz.

4. komut satırında `$ /etc/init.d/hostname.sh` çalıştırıyoruz

5. çıkış yapıp tekrar girin ve aşağıdaki kontroller `moodle` çıktısı üretmeli

	$ uname -n
	moodle

	$ hostname
	moodle
