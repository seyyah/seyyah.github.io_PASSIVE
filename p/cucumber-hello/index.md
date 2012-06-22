# Cucumber: Hello World!

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/cucumber-hello

---

# Kitap

- The Cucumber Book: Behaviour-Driven Development for Testers and Developers,

- Matt Wynne and Aslak Hellesoy

![book](https://a248.e.akamai.net/camo.github.com/f2fa0567f017aa27f545a34ebc5c1a1546e8855d/687474703a2f2f63756b65732e696e666f2f696d616765732f68776375632d313930783232382e6a7067)

---

# Ne

BDD that talks to domain experts first and code second.

![fixme](http://cukes.info/images/feature.png)
![fixme](http://cukes.info/images/failing.png) -
![fixme](http://cukes.info/images/pending.png)

---

# Nasıl
---

## Ön Hazırlık

Gemfile,

    !ruby
    gem 'mysql2'
    group :test do
      gem 'cucumber-rails', :require => false
      # database_cleaner is not required, but highly recommended
      gem 'database_cleaner'
    end

Veritabanlarını oluştur: `19/x -> "Yönetim Görevleri" -> "Mysql Veritabanı Oluştur"`

---

## Örnek: config/database.yml

.gist: 2964864

---

## Son vuruşlar

Konsol,

    !sh
    $ rake db:migrate
    $ rake db:test:prepare
    $ bundle
    $ rails generate cucumber:install
---

# Until green like a cuke

## Feature

yaz,

.gist: 2964925

---

## Step

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

## Test

- Test et

        !sh
        $ cucumber

- Yeşile döndürmek için kodla, tekrar test et.

- Tümü yeşil olunca bitir.

---

# Senaryolar

- Hello world: [Cucumber-Senaryo](../cucumber-senaryo-hello)

- Factory: [[Cucumber-Senaryo-Factory]]

---

# Kaynaklar

- Resmi sitesi: <http://cukes.info/>

- Rails Gem sayfası: <https://github.com/cucumber/cucumber-rails>

- Gem sayfası: <https://github.com/cucumber/cucumber>

- Wiki sayfası: <https://github.com/cucumber/cucumber/wiki/>

- Railscasts:

[![Beginning with Cucumber](http://railscasts.com/assets/episodes/stills/155-beginning-with-cucumber.png)](http://railscasts.com/episodes/155-beginning-with-cucumber)
[![More on Cucumber](http://railscasts.com/assets/episodes/stills/159-more-on-cucumber.png)](http://railscasts.com/episodes/159-more-on-cucumber)
[![Pickle with Cucumber](http://railscasts.com/assets/episodes/stills/186-pickle-with-cucumber.png)](http://railscasts.com/episodes/186-pickle-with-cucumber)
[![Spork](http://railscasts.com/assets/episodes/stills/285-spork.png)](http://railscasts.com/episodes/285-spork)
