# Rails: İpucu

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/rails-ipucu

---

# rails new

Amacım mysql ile başlamak ve test-unit'lerini atlamak

    !bash
    $ rails help new
    $ rails new Edessa --skip-test-unit --database=mysql

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

# Model
---

# HABTM + establish_connection

Kaynak:
<http://stackoverflow.com/questions/184600/has-and-belongs-to-many-relationship-with-multiple-databases>

---

# Guide
---

# Eager Loading

Eager loading, bağlantılı modellerde daha az veritabanı sorgusunu sağlar. Şöyle
bir modelimiz olsun,

    !ruby
    class Post < ActiveRecord::Base
      belongs_to :author
      has_many   :comments
    end

şöyle bir sorgu çekildiğinde,

    !ruby
    Post.all.each do |post|
      puts "Post:            " + post.title
      puts "Written by:      " + post.author.name
      puts "Last comment on: " + post.comments.first.created_on
    end

ve 100 adet Post varsa `title` için `1`, `author.name` için `100` ve
`comments.*` için `100` sorgu çekilmek zorunda kalır. Dolayısıyla toplamda `201`
sorgu yapar.

`belongs_to` ilişkisini dikkate alması söylersek,

    !ruby
    Post.includes(:author).each do |post|

Post'lar yüklendikten sonra, herbirinden `author_id`'leri toplar ve bir sorguda
tüm author referanslarını yükler. Dolayısıyla sorgu sayısı `201` den `102`'e
düşer.

---

# Eager Loading: derinlemesine

Comment'leri de benzer biçimde yükletirsek,

    !ruby
    Post.includes(:author, :comments).each do |post|

Tek sorguyla comment'ler de yüklenince `201`'den `3`'e inmiş oluruz.

Daha derinlere gitmek istersen comment'in author'u ve hatta gravatar'larını da
yükleyeceğim dersek,

    !ruby
    Post.includes(:author, {comments: {author: :gravatar}}).each do |post|

---

# Eager Loading: conditions

Gereksiz kayıtların getirildiği şöylesi bir sorguyu,

    !ruby
    Post.includes([:author, :comments]).where(
      ['comments.approved = ?', true]).all

comment'lerden approved edilmemişlerin include işleminde yüklenmesine gerek yok!
Bunu şöyle sağlarız,

    !ruby
    class Post < ActiveRecord::Base
      has_many :approved_comments, class_name: 'Comment',
               conditions: ['approved = ?', true]
    end

    Post.includes(:approved_comments)

limit seçeneği de belirtilebilir,

    !ruby
    class Picture < ActiveRecord::Base
      has_many :most_recent_comments, class_name: 'Comment',
               order: 'id DESC', limit: 10
    end

    Picture.includes(:most_recent_comments).first.most_recent_comments
    # => returns all associated comments.

---

# Eager Loading: polymorphic

polymorphic bağlarda da kullanılabilir,

    !ruby
    class Address < ActiveRecord::Base
      belongs_to :addressable, :polymorphic => true
    end

    Address.includes(:addressable)

Kaynak

- <http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html>
- <http://guides.rubyonrails.org/association_basics.html>

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

Environment bilgisi,

    !bash
    $ rails console production

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
