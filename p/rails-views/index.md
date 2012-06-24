# Rails - Views

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/rails-views

---

# Form: Formtastic

Örnek çalışma,

    !sh
    $ git branch -t test
    $ rails g model Test name:string content:text
    $ rake db:migrate
    $ rails generate formtastic:form Test --template-engine slim
      create  app/views/tests
      create  app/views/tests/_form.html.slim

Form,

    !slim
    # app/views/tests/_form.html.slim
      = semantic_form_for @test do |f|
        = f.inputs do
          = f.input :name
          = f.input :content

        = f.buttons do
          = f.commit_button

- [Form
  Generator](http://rubydoc.info/github/justinfrench/formtastic/master/Formtastic/FormGenerator)
---

# Form: Design

- [Best Practices for Form
  Design](http://www.slideshare.net/psykoreactor/best-practices-for-form-design)

- [Learning to Love
  Forms](http://www.slideshare.net/AaronGustafson/learning-to-love-forms-web-directions-south-07)

---

# Genel

- [What should every programmer know about web
  development?](http://programmers.stackexchange.com/questions/46716/what-should-every-programmer-know-about-web-development)
