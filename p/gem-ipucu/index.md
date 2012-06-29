# Gem: İpucu

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/gem-ipucu

---

# Sqlite3

`sqlite3` kurulumu öncesinde,

    !bash
    $ apt-get install libsqlite3-dev

`pg` için,

    !bash
    $ apt-get install libpq-dev

---

# Heroku

Örnek

  group :development, :test do
    gem 'sqlite3'
  end

  group :production do
    gem 'pg', '0.12.2'
  end
