# Devise

TODO

---

# Yetenekleri

 It's composed of 12 modules:

- Database Authenticatable: encrypts and stores a password in db

- Token Authenticatable: signs in a user based on an authentication token

- Omniauthable: adds Omniauth (https://github.com/intridea/omniauth) support;

- Confirmable: sends emails with confirmation and verifies

- Recoverable: resets the user password and sends reset instructions.

- Registerable: handles signing up users

- Rememberable: manages remembers; saved cookie.

- Trackable: tracks sign in count, timestamps and IP address.

- Timeoutable: expires sessions

- Validatable: provides validations of email and password.

- Lockable: locks an account after a specified number of failed sign-in

---

# Okuma Listesi

- <http://rails-bestpractices.com/blog/posts/14-migrate-from-authlogic-authlogic-connect-to-devise-omniauth>
- <http://www.sitepoint.com/10-ruby-on-rails-best-practices/#.T-1oB6VzSBt>
- <http://railsapps.github.com/tutorial-rails-devise-rspec-cucumber.html>

- <https://github.com/railscasts/250-authentication-from-scratch>

---

# Örnek Uygulama


---

# Ön ayarlar

Controller'da,

    !ruby
    class ProjectsController < ApplicationController
        before_filter :authenticate_user!, except: [:show, :index]
    end
