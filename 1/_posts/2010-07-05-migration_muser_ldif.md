---
layout: post
title: moodle user ldif örnek dosyası
---

örnek dosya:

	dn: ou=moodleusers,dc=debuntu,dc=local
	objectClass:organizationalUnit
	objectClass: top
	ou: moodleusers

	dn: cn=moodle,ou=moodleusers,dc=debuntu,dc=local
	objectClass: inetOrgPerson
	uid: moodle
	givenName: Admin
	sn: User
	mail: your@mail.adress
	userPassword: {MD5}MD5_PASSWD
