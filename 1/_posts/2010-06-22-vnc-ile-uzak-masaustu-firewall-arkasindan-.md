---
layout: post
title: xtightvnc ile firewall arkasindaki makinenin ekranina erişim
---

Bu gönderide VNC yardımıyla ev makinenizden, işdeki firewallun arkasındaki makinenize uzak masaüstü bağlantısı veya ekranına erişim nasıl olur, bundan bahsedeceğiz.

# bilgi

işteki makineye atlama için kullanacağımız makinenin IP si 193.140.123.456 ve iş makinemizin iç ağdaki IP adresi 192.168.140.123 olsun.

- VNC sunucu olarak işteki makineyi
- VNC istemci olarakta evdeki makineyi kastediyoruz

- tüm üç makinede Linux işletim sistemi vardır.

# kurulum

## VNC sunucu tarafında 

- önce tightvncserver i kuruyoruz, bu makineye VNC üzerinden bağlantıda istenecek şifreyi giriyoruz (TIGHTVNC_SERVER_SIFRE)

	$ sudo apt-get install tightvncserver

- şimdi vnc sunucuyu çalıştırıyoruz uzak bağlantıda ekran 800x600 çözünürlüğünde ve 16 bit derinliğinde olacak, 1 nolu ekran

	$ vncserver -geometry 800x600 -depth 16 :1

- öntanımlı ayarlarıyla oynanmadıktan sonra VNC sunucusunun 5901 nolu portundan hizmet verilmektedir.

- SAKIN: sunucuyu root haklarıyla başlatmayın. Başka sakıncalarının yanısıra Ubuntu makinede `root` hesabı olmadığından uzaktan bu makineye vnc ile bağlanılmaya çalışılınca klavye sorunu (keyboard mapping problem) yaşanıyor.

## VNC istemci tarafında

- önce istemci yazılımını yükleyelim

	$ sudo apt-get install xtightvncviewer

- şimdi bağlantıyı sağlayalım

	$ xtightvncviewer -via 193.140.123.456 192.168.140.123:5901

- önce atlama makinesindeki şifrenizi girin, sonra VNC sunucuya bağlanma şifrenizi (TIGHTVNC_SERVER_SIFRE) girin

