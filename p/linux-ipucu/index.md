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

---
# MPEG4, MP3, AAC Codec

Ubuntu Precise Pangolin 12.04 LTS and Ubuntu Oneiric Ocelot 11.10,

    !bash
    $ sudo apt-get install ffmpeg libavcodec-extra-53

---

# 32 bit X 64 bit

İpucu,

    !bash
    $ cat /proc/cpuinfo | grep lm  # long mode?

çıktıda varsa _64 bit_ yoksa _32 bit_'tir.

Diğer taraftan

    !bash
    $ uname -a
    ... x86_64

bu da kernelin 64 bit olup-olmadığı bilgisini sağlar.

---

# SSH

Key'i üretip Github'a bu keyi eklemek için,

    !bash
    $ sudo apt-get install xclip
    $ ssh-keygen -t dsa
    $ xclip -i ~/.ssh/id_dsa.pub

Github'da [Account Settings:ssh](https://github.com/settings/ssh) "Add SSH key". Test edelim,

    !bash
    $ ssh -vT git@github.com

Sanala/sunucuya bağlanmak için kısayol tanımla,

    !bash
    # ~/.ssh/config
    Host kisa_ad
      HostName 1.2.3.4
      User seyyah
      ForwardAgent yes

Artık kısa adla erişebiliriz,

    !bash
    $ ssh kisa_ad

Parolasız erişim için,

    !bash
    $ ssh-copy-id kisa_ad ~/.ssh/id_dsa.pub
    $ ssh kisa_ad

---

# Bash

Find,

    !bash
    $ find . -type f -perm 0755 |
      xargs /bin/chmod 0644
