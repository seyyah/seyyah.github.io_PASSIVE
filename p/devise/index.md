# Devise

TODO

---

# Ön ayarlar

Controller'da,

    !ruby
    class ProjectsController < ApplicationController
        before_filter :authenticate_user!, except: [:show, :index]
    end
