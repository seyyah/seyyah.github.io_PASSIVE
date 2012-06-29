# Devise

TODO

---

# Ön ayarlar

Controller'da,

    !ruby
    class ProjectsController < ApplicationController
        before_filter :authenticate_user!, except: [:show, :index]
    end

---

# Okuma Listesi

- http://rails-bestpractices.com/blog/posts/14-migrate-from-authlogic-authlogic-connect-to-devise-omniauth
- http://www.sitepoint.com/10-ruby-on-rails-best-practices/#.T-1oB6VzSBt
- http://railsapps.github.com/tutorial-rails-devise-rspec-cucumber.html
