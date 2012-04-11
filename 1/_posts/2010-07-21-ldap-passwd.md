---
layout: post
title: ldap passwd
---

LDAP konfigurasyon dosyaları şurada: `/etc/ldap/*.conf`.

`rootpw` değişkeni root passwordu tutmaktadır. Konfigurasyon dosyasında clear text olarak passwordu tutmak çok sağlıklı bir seçim değil. bunun yerine `slappasswd` işlevini kullanarak şifreli password üretmek ve bunu konfigurasyon dosyasına koymak daha uygun bir yol gözüküyor.

1. şifreli password üretme (ayrıntılar için `man slappasswd`)
		
		$ slappasswd -h {CRYPT} -c '$2a$05$%.24s'
		{CRYPT}URETILEN_DEGER

2. `/etc/ldap/slapd.conf` dosyasına aşağıdaki satırı ekle

		rootpw {CRYPT}URETILEN_DEGER

3. ayarların etkili olabilmesi için `/etc/init.d/slapd restart` yeniden başlat.

## Kaynaklar

1. <http://www.openldap.org/doc/admin24/slapdconfig.html>
