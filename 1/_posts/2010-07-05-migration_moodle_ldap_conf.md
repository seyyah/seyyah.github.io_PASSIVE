---
layout: post
title: moodle ldap ayarları
---

## LDAP server settings

- Host URL: 192.168.56.101
- Version: 3
- LDAP encoding: utf-8

## Bind settings

- Hide passwords: no
- Distinguished Name: cn=admin,dc=debuntu,dc=local
- Password: LDAP_PASSWORD

## User lookup settings

- User type: Default
- Contexts: ou=moodleusers,dc=debuntu,dc=local
- Search subcontexts: No
- Dereference aliases: No
- User attribute: 	(BOŞ)
- Member attribute:	(BOŞ)
- Member attribute uses dn: 	(BOŞ)
- Object class:		(BOŞ)

## Force change password

- Force change password: Yes
- Use standard Change Password Page: No
- Password format: Plain text
- Password-change URL:		(BOŞ)

## LDAP password expiration settings

- Expiration: no
- Expiration warning: 10
- Expiration attribute: 	(BOŞ)
- Grace logins: No
- Grace login attribute:	(BOŞ)

## Enable user creation

- Create users externally: Yes
- Context for new users:	(BOŞ)

## Course creator

- Creators: ou=creators,ou=moodleusers,dc=debuntu,dc=local

## Cron synchronization script

- Removed ext user: Suspend internal

## Data mapping

Öntanımlı değerler (yani BOŞ bırakıldı).
