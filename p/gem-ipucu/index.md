# Gem: İpucu

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/gem-ipucu

---

# Bağımlılık

`sqlite3` kurulumu öncesinde,

    !bash
    $ sudo apt-get install libsqlite3-dev

`pg` için,

    !bash
    $ sudo apt-get install libpq-dev

`ckeditor` için,

    !bash
    $ sudo apt-get install imagemagick

---

# Heroku

Örnek

  group :development, :test do
    gem 'sqlite3'
  end

  group :production do
    gem 'pg'
    gem 'activerecord-postgresql-adapter'
  end
