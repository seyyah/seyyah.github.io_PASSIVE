# Git: İpucu

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/git-ipucu

---

# Tags

Yeni bir tag oluştururken,

	!bash
	$ git tag -a v1.4 -m "version 1.4"
	$ git log
	67278c7f5f3a3b009a1474ca201f2b52f7728262 bla bla
	$ git tag -a v1.0-ustad -m "version 1.4" 67278c7f5f3a3b009a1474ca201f2b52f7728262

Tag leri listelerken,

	!bash
	$ git tag
	$ git tag -l v1.*
	v1.1
	v1.2

Tag i göstermek,

	!bash
	$ git show v1.4

Tag leri paylaşmak,

	!bash
	$ git push --tags

Kaynak: <http://learn.github.com/p/tagging.html>

---

# Checkout

Dal ismi olmaksızın,

	!bash
	$ git log
	67278c7f5f3a3b009a1474ca201f2b52f7728262 bla bla
	$ git checkout 67278c7f5f3a3b009a1474ca201f2b52f7728262
	$ git branch
	$ git checkout -b v1.0-ustad
	$ git branch

Kaynak: [GETTING OLD VERSIONS](http://gitimmersion.com/lab_12.html)
