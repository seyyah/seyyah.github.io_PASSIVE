# Linux: İpucu

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/linux-ipucu

---

# Rsync

A makinesine `a_klasor`'ünü B makinesinde senkronlamak (tek taraflı)

	!bash
	# Makine A
	$ rsync -vauz -delete -rsh=ssh -stats a_klasor
	  seyyah@example.com:/home/seyyah/b_klasor

- bu kod A makinesinde yer alan `a_klasor`'ünü,

- B makinesinde `b_klasor`'ü olarak rsync eder

Kaynak:
<http://www.arsgeek.com/2006/10/20/quicktips-how-to-rsync-files-and-folders-to-remote-machines-using-ssh/>
