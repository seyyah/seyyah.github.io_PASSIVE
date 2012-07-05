# Rails: Sessions & Cookies

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/rails-sessions

---

# Introduction

- HTTP stateless protokoldür

- İstemci/tarayıcı ile sunucu arasında ki oturum ID'leri nasıl tutulacak?

  + URL'ye göm
  + Form'a göm
  + cookies kullan

---

# Sessions

---

# Sessions in Rails

- Session, hash benzeri yapıda tutulur

- request'ler arasında veri aktarımını mümkün kılar

- session_id: 32 hex karakter, MD5, rastgele, sabit. İstemci/tarayıcıda
  saklanır.

- session storage'da saklanır.

---

# Session Data

- farklı tarayıcı istekleri arasında saklanan **bilgi**, `Session Data`

- Her bir ziyaret için session data, ya sunucuda ya da cooki'lerde saklanır

- İstemci/tarayıcı sunucudan istekte bulunduğunda,

    + session data session storage'den (ör. `reddis`)

    + istemcinin tarayıcısının gönderdiği

    + session ID kullanılarak çıkarılır

- session data'ya en iyi örnek: "authentication" (yetkilendirme) için kullanıcı
  bilgisidir.

---

# Örnek

Dikkatli incelenmesi gereken bir kod,

      !ruby
      def index
         cookies[:key] = "val"
         puts cookies[:key]
         redirect_to :second_index
      end

      def second_index
         cookies[:key] = "newval"
         puts cookies[:key]
      end

Output,

      !ruby
      ## Open index page for the first time
      # nil
      # val

      ## Open index page the second time
      # newval
      # val

Neden?

> cookies[] gives you value from the **incoming** cookie.
> cookies[]= sets value in the **outgoing** cookie.

---

# Kaynaklar

1. [Sessions and cookies in Ruby on
   Rails](http://www.quarkruby.com/2007/10/21/sessions-and-cookies-in-ruby-on-rails)

## Okunası Kaynaklar

1.
<http://stackoverflow.com/questions/377137/rails-multiple-top-level-domains-and-a-single-session-cookie>

