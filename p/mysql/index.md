# MySQL

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/mysql

---

# Dump

no-create-info

    !bash
    $ mysqldump -u tsim --no-create-info tsim
      node --where="nid='123'" -p > f.sql

    $ mysqldump -u tsim --no-create-info tsim
      connector --where="inp='123'" -p >> f.sql
