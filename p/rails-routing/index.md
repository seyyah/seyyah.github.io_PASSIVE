# Routing

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/rails-routing

---

# 1 The Purpose of the Rails Router

## 1.1 Connecting URLs to Code

Şöylesi bir istek,

    !ruby
    GET /patients/17

şöyle eşleştirilir,

    !ruby
    match "/patients/:id" => "patients#show"

ve `{ id: 17 }` parametresini aktarır.

## 1.2 Generating Paths and URLs from Code

Path ve URL'leri şöyle üretiriz,

    !ruby
    # controller
    @patient = Patient.find(17)

    # view
    <%= link_to "Patient Record", patient_path(@patient) %>

bu şöyle bir path üretir: `/patients/17`

---

# 2 Resource Routing: the Rails Default

Tek kalemde tüm route'ları tanımla

    !ruby
    index, show, new, edit, create, update and destroy

## 2.1 Resources on the Web

Herhangi bir HTTP isteği (GET, POST, PUT and DELETE) geldiğinde,

    !ruby
    DELETE /photos/17

routing'de şöyle bir satır yazıldıysa,

    !ruby
    resources :photos

buna karşılık controller'da `destroy` yöntemine `{ id: 17 }` argümanını geçer.

---

# 2.2 CRUD, Verbs, and Actions

Her bir eylemin veritabanında bir işleme karşılık düşer,

![](http://i.imgur.com/dnwSk.png)

Yönlendirme tablosu yukarıdan aşağıya eşleşme düzenindedir.

---

# 2.3 Paths and URLs

`resources :photos` path'e aşağıda ki girdileri ekler,

    !ruby
    photos_path          => /photos
    new_photo_path       => /photos/new
    edit_photo_path(:id) => /photos/:id/edit
    photo_path(:id)      => /photos/:id

Ayrıntılar,

- `edit_photo_path(10) => /photos/10/edit`
- `photo_path(10) => /photos/10`

Diğer taraftan `_path` yerine `_url` kullanılırsa full-path sağlar.
Örneğin `edit_photo_url(10) => http://ustad.us/photos/10/edit`

---

# 2.4 Multiple Resources

çok sayıda yönlendirme tek satırda,

	!ruby
	resources :photos, :books, :videos

---

# 2.5 Singular Resources

ID kullanmak istemeyebilirsiniz. Ör. login olmuş kullanıcının `profile` sayfası

	!ruby
	match "profile" => "users#show"

---

# 2.5 Singular Resources: çoğul X tekil

Ayrıca `resources` cümlesinde nesnenin çoğul **değil** tekil hali kullanılırsa,

	!ruby
	resource :geocoder

bu durumda yönlendirme tablosu

![](http://i.imgur.com/s8Zd5.png)

---

# çoğul durum yönlendirme tablosu

Bunu #slide4 ile karşılaştırın, (Burada ID'nin yer almadığına dikkat ediniz)

    !ruby
    resources :photos

buna dair yönlendirme tablosu şöyleydi,

![](http://i.imgur.com/dnwSk.png)

---

# 2.6 Controller Namespaces and Routing

- Controller'ları gruplamak için namespace kullanabilirsiniz.

- Örnek `Admin::` namespace, tüm buna dair controller'lar `app/controller/admin/`
  klasörü altında tutulur

- yönlendirme tablosunda

		!ruby
		namespace :admin do
		  resources :posts, :comments
		end

---

# namespace yönlendirme tablosu

Ör. `Admin::PostsController` için,

![](http://i.imgur.com/wHKAo.png)

---

# prefix: namespace + scope | module

Eğer url'de prefix (`/admin/`) kullanmak istemezseniz

	!ruby
	scope module: "admin" do
	  resources :posts, :comments
	end

ya da tek durum için,

	!ruby
	resources :posts, module: "admin"

Eğer controller'da ki prefix'i kaldırmak isterseniz

	!ruby
	scope "/admin" do
	  resources :posts, :comments
	end

ya da tek durum için,

	!ruby
	resources :posts, path: "/admin/posts"

---

# namespace: prefix olmaksızın

prefix olmaması durumları (son ikisi) için yönlendirme tablosu,

![](http://i.imgur.com/xIUVl.png)

---

# Me: OSCE: namespace

Bizde olması planlanan namespace

	manage/questions/
	      /examinations/
	statistics/
	student/examinations/
	report/examinations/

---

# 2.7 Nested Resources

Bir resources diğerinin çocuğu ise,

	!ruby
	class Magazine < ActiveRecord::Base
	  has_many :ads
	end

	class Ad < ActiveRecord::Base
	  belongs_to :magazine
	end

Bu durumda,

	!ruby
	resources :magazines do
	  resources :ads
	end

---

# nested: yönlendirme tablosu

helper: magazine_ads_url(@magazine), edit_magazine_ad_path,

<img src=http://i.imgur.com/80iRo.png height=500>

---

# Me: OSCE: nested

bu duruma aday olanlar:

- examinations - questions

---

# 2.8 Creating Paths From Objects

şöyle bir yönlendirmemiz olsun,

	!ruby
	resources :magazines do
	  resources :ads
	end

sayısal ID yerine instance geçebilirsiniz,

	!ruby
	<%= link_to "Ad details", magazine_ad_path(@magazine, @ad) %>

VEYA `url_for` kullanarak (diziye dikkat!),

	!ruby
	<%= link_to "Ad details", url_for([@magazine, @ad]) %>

VEYA kısaltarak,

	!ruby
	<%= link_to "Ad details", [@magazine, @ad] %>

Eğer ebeveyn resources'a link vermek istiyorsanız (dizi değil!),

	!ruby
	<%= link_to "Magazine details", @magazine %>

---

# 2.9 Adding More RESTful Actions
# 3 Non-Resourceful Routes
