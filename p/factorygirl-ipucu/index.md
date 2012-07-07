# Factory Girl: İpucu

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/factorygirl-ipucu

---

# Gemfile

Rails için

        !ruby
        gem 'factory_girl_rails'

Kaynak: https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

---

# Factory Girl + Cucumber

`features/support/env.rb` dosyasında,

        !ruby
        require 'factory_girl'
        # FactoryGirl.find_definitions

---

# Debug

- Feature dosyasında `raise variable`

---

# Etc

Konsol

	!ruby
	FactoryGirl.factories
	FactoryGirl.factories.clear
	FactoryGirl.factories.reload

---

# Kaynaklar

- http://xtargets.com/2011/02/06/seeding-your-rails-db-with-factory-girl/
- http://stackoverflow.com/questions/9861075/how-can-i-load-seeds-rb-into-the-test-database-without-breaking-factorygirl?lq=1
- http://robots.thoughtbot.com/post/254496652/aint-no-calla-back-girl
- http://stackoverflow.com/questions/1484374/how-to-create-has-and-belongs-to-many-associations-in-factory-girl
- http://ditoinfo.wordpress.com/2008/11/19/factory-girl-and-has_many-has_many-through-associations/
- http://stackoverflow.com/questions/4071205/creating-fixture-data-for-model-using-acts-as-taggable-on


