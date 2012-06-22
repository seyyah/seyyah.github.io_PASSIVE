# Cucumber: Senaryo: Hello World!

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/cucumber-senaryo-hello

---

# Kitap

- The Cucumber Book: Behaviour-Driven Development for Testers and Developers,

- Matt Wynne and Aslak Hellesoy

---

# Feature

yaz,

.gist: 2964925

---

# Step

yaz,

    !ruby
    Given /^I go to the new institution page$/ do
      visit new_institution_path
    end

    Given /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
      fill_in(arg1, with: arg2)
    end

    When /^I press "(.*?)"$/ do |arg1|
      click_button arg1
    end

    Then /^I should be on the institution list page$/ do
      page.should have_content('List Institutions')
    end

    Then /^I should see "(.*?)"$/ do |arg1|
      page.should have_content(arg1)
    end

---

# Adımlayalım
---
# Adımlayalım: Adım 1

## ADIM 1: Given I go to the new institution page
---

# Adımlayalım: Adım 1: a
### ADIM 1.a: senaryonun ve adımlarının yazılmasıdır.
---

# Adımlayalım: Adım 1: b
### ADIM 1.b

    !sh
    $ cucumber

![hepsi kırmızı](http://i.imgur.com/P2a3al.jpg)

Hatanın kaynağı `visit new_institution_path` de path'in olmayışı.

---

# Adımlayalım: Adım 1: b
### ADIM 1.b

Path'i ekleyelim,

    !ruby
    # config/routes.rb
    resources :institutions

Testleri çalıştıralım,

    !sh
    $ cucumber

![fixme](http://i.imgur.com/H52DMl.jpg)

Hatanın kaynağı `InstitutionsController`'u bulamayışıdır.

---

# Adımlayalım: Adım 1: c
### ADIM 1.c

Controller'u oluşturalım,

    !bash
    $ rails g controller Institutions new

Testleri çalıştıralım,

    !sh
    $ cucumber

![fixme](http://i.imgur.com/JXPmfl.jpg)

Hatanın kaynağı doldurulacak bir formun olmayışı.

Bu arada `fill_in`, [Capybara: matcher](https://github.com/jnicklas/capybara/blob/master/lib/capybara/node/actions.rb#L36)'ından gelir.

---

# Adımlayalım: Adım 2
## ADIM 2: And I fill in "Name" with "OMÜ"
---

# Adımlayalım: Adım 2: a
### ADIM 2.a:

Form'u hazırla,

    !ruby
    # new.html.rb
    <%= form_for @institution do |f| %>
      <%= f.label :name %>
      <%= f.text_field :name %>
      <%= f.submit 'Create' %>
    <% end %>

Testleri çalıştıralım,

    !sh
    $ cucumber

![fixme](http://i.imgur.com/CGBaHl.jpg)

Hatanın kaynağı model'in instance'ını bulamaması.

---

# Adımlayalım: Adım 2: b
### ADIM 2.b:

Controller'a `new` metodunu ekle,

    !ruby
    # app/controllers/institutions_controller.rb
    def new
      @institution = Institution.new
    end

Testleri çalıştıralım: `$ cucumber`

![fixme](http://i.imgur.com/nqIsjl.jpg)

Hatanın kaynağı, model'i bulamamasıdır.

---

# Adımlayalım: Adım 2: c
### ADIM 2.c:

Model'i oluştur,

    !ruby
    # app/models/institution.rb
    class Institution < ActiveRecord::Base
    end

Testleri çalıştıralım,

    !sh
    $ cucumber

![fixme](http://i.imgur.com/ABv3Ll.jpg)

Hatanın kaynağı, `Table 'edessa_test.institutions' doesn't exist` yani tablonun olmayışıdır.

---

# Adımlayalım: Adım 2: d
### ADIM 2.d:

Migration yapmalısın,

    !sh
    $ rails g migration CreateInstitutions name:string
    $ rake db:migrate
    $ rake db:test:prepare

Testleri çalıştıralım,

    !sh
    $ cucumber

![fixme](http://i.imgur.com/pEDORl.jpg)

Hatanın kaynağı, `The action 'create' could not ...`  `create` eylemini bulamamasıdır.

---

# Adımlayalım: Adım 3
## ADIM 3: When I press "Create"
---

# Adımlayalım: Adım 3: a
### ADIM 3.a:

Controller:create metodunu oluşturalım,

    !ruby
    # app/controllers/institutions_controller.rb
    def create
      redirect_to institutions_path
    end

Testleri çalıştıralım: `$ cucumber`

![fixme](http://i.imgur.com/N1nSXl.jpg)

Template model oluşturulurken verildiğinden bu aşama yeşillendi. Hata, index sayfası "List Institutions" içermelidir.

---

# Adımlayalım: Adım 4
## ADIM 4: Then I should be on the institution list page
---

# Adımlayalım: Adım 4: a
### ADIM 4.a:

View:list oluşturalım,

    !ruby
    # app/views/institutions/index.html.erb
    <h2>List Institutions</h2>

Testleri çalıştıralım,

    !sh
    $ cucumber

![fixme](http://i.imgur.com/XqnYul.jpg)

Bu aşamada yeşillendi. Fakat listede "OMÜ" olmamasına kızıyor.

---

# Adımlayalım: Adım 5
## ADIM 5: And I should see "OMÜ"
---

# Adımlayalım: Adım 5: a
### ADIM 5.a: önce institutions listesini basmayı deneyelim.

View:list, institutions'ları dikkate alsın,

    !ruby
    # app/views/institutions/index.html.erb
    <%= render @institutions %>

Testleri çalıştıralım,

    !sh
    $ cucumber

![fixme](http://i.imgur.com/PbhfGl.jpg)

Hata var çünkü `@institutions` değişkeni ilgili kontrollerda `index` eylemiyle doldurulmamış.

---

# Adımlayalım: Adım 5: b
### ADIM 5.b: index ve create eylemini güncelle.

Controller:create ve :index'i güncelle,

    !ruby
    # app/controllers/institutions_controller.rb
    def index
      @institutions = Institution.all
    end
    def create
      @institution = Institution.new(params[:institution])

      redirect_to institutions_path if @institution.save
    end

Testleri çalıştıralım: `$ cucumber`

Hata, `Can't mass-assign protected attributes: name`.

![fixme](http://i.imgur.com/ctyqHl.jpg)


---

# Adımlayalım: Adım 5: c
### ADIM 5.c:

Model:name erişim izni ver,

    !ruby
    # app/models/institutions.rb
    class Institution < ActiveRecord::Base
      attr_accessible :name
    end

Testleri çalıştıralım,

    !sh
    $ cucumber

![fixme](http://i.imgur.com/ZXqp2l.jpg)

Hata, `Missing partial institutions/institution with ...`.

---

# Adımlayalım: Adım 5: d
### ADIM 5.d:

View:form oluşturalım,

    !ruby
    #app/views/institutions/_institution.html.erb
    <%= institution.name %>

Testleri çalıştıralım,

    !sh
    $ cucumber

![fixme](http://i.imgur.com/trO59l.jpg)

Tamamı yeşillendi.

---

# Kaynaklar

- [Rails 3.1 and Cucumber: getting started with outside-in testing](http://ridingrails.net/rails-3-cucumber-started-outside-in-testing/)
