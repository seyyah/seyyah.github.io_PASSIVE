# Rails: İpucu

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/rails-ipucu

---
# UTF-8

controller vs sayfalarında utf-8 desteği için,

    !ruby
    # encoding: utf-8

---

# Generator: Scaffold: only view

Evet sadece view üretmek istersek,

    !bash
    $ rails generate scaffold Institution --migration=false --skip

---

# Exception: ActiveRecord
## ::MultiparameterAssignmentErrors

Örnek

    !ruby
    def foo
      ...
    rescue ActiveRecord::MultiparameterAssignmentErrors
      flash[:error] = "Error: Collection of errors that occurred
      		   during a mass assignment using the attributes= method."
      redirect_to home_path
    end

Kaynak

- http://api.rubyonrails.org/classes/ActiveRecord/Base.html

---

# Rake

İpuçları,

    !bash
    $ rake -T
    $ rake routes
    $ rake db:drop
    $ rake db:create
    $ rake db:migrate
    $ rake db:seed
    $ rake db:setup 	# create + load:schema + seed
    $ rake db:reset 	# drop + setup
    $ rake db:test:prepare
    $ rake db:migrate RAILS_ENV="production"

---

# Console

Authentication,

    !ruby
    > User.last.authenticate('secret')

---

# Logger

Controller'da,

    !ruby
    # foo_controller.rb
    logger.info { "foo #{variable}" }

---

# Sunucu
---

# Heroku

Başlarken

    sudo gem install heroku
    heroku keys:add ~/.ssh/id_dsa.pub

Depoda tek dal durumu,

    heroku create --stack cedar
    git push heroku master
    heroku run rake db:migrate

Birden fazla dal durumu,

    heroku create APP_NAME --stack cedar --remote heroku_XX
    git push heroku_XX dal_XX:master
    heroku run rake db:migrate --app APP_NAME
    heroku logs --app APP_NAME

precompile,

    !ruby
    # config/environments/production.rb
    config.assets.compile = true

---

# Unicorn

Başlat/durdur,

    !bash
    $ sudo service unicorn start | stop

---

# Benchamark

Yollardan birisi,

    !bash
    $ time bundle exec rspec ...
