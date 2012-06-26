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


