# Cucumber: Book

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/cucumber-ebook

---

# Kitap

- The Cucumber Book: Behaviour-Driven Development for Testers and Developers,

- Matt Wynne and Aslak Hellesoy

![book](https://a248.e.akamai.net/camo.github.com/f2fa0567f017aa27f545a34ebc5c1a1546e8855d/687474703a2f2f63756b65732e696e666f2f696d616765732f68776375632d313930783232382e6a7067)

---

# Part I: Cucumber Fundamentals

---

# Chapter 1: Tanımlar

Automated Acceptance Test:

- eXtreme Programlamaya ait bir kavramdır (XP)

- özellikle de Test Temelli Geliştirme (TDD)

---

# Örnek

.code: code/first_taste/00/hello.feature

---

# Cucumber Nasıl Çalışır?

- Cucumber, komut satırı aracıdır

- `feature`'larda yer alan spec'leri okur

- `feature`, test edilmesi hedeflenen senayo metnidir

- her bir senaryo, `step`'lerden oluşur

- Cucumber'in bu dosyalarda yazanları anlaması için temel bir sözdizimi vardır

- Bu söz dizimi kurallarına `Gherkin` denilir.

- tüm dosyalar aslında ruby dilinde kodlanırlar

---

# Cucumber Testing Stack

<img src=http://i.imgur.com/VJ5fW.png height="500">

---

# Chapter 2: First Taste

---

# 2.2 Creating a Feature

.code: code/first_taste/01/features/adding.feature

---

# Main Layers of Cucumber Test Suite

![figure 2](http://i.imgur.com/C0ZxJl.jpg)

---

# 2.3 Creating Step Definitions

.code: code/first_taste/02/features/step_definitions/calculator_steps.rb 9 $

---

# 2.4 Implementing Step Definitions

.code: code/first_taste/03/features/step_definitions/calculator_steps.rb 9 $

- burada oluşturulan `@input` daha sonradan kullanılacak/global

- `$ cucumber` dediğimizde ilk yeşili görürüz

---

# Cucumber

![figure 2](http://i.imgur.com/7o4wj.png)

---
# 2.5 Running Our Program

.code: code/first_taste/04/features/step_definitions/calculator_steps.rb 9 $

- önceki adımda ki `@input` kullanılabiliyor
- harici kod çalıştır, `$?` komut satırı çıktısı hakkında bilgi toplar
- `raise`, `cucumber` çalıştırıldığında yol gösterici hatayla donatılmalıdır

---

# Cucumber

![figure 2](http://i.imgur.com/0Hxu2.png)

---

# 2.7 Adding an Assertion

Önce dizin yapımıza göz atalım,

	!bash
	$ cd ~/test/
	$ ls -R
	features/foo.feature
	features/step_definitions/foo_steps.rb
	$ cucumber

Şimdi `calc.rb` dosyasını oluşturalım

	!bash
	$ cat print "1"> calc.rb
	$ ls -R
	calc.rb
	features/foo.feature
	features/step_definitions/foo_steps.rb

Test edelim,

	$ cucumber

---

# Son adım

![fixme](http://i.imgur.com/8VNB4.png)

Tatmin edecek step'i yazalım,

.code: code/first_taste/07/features/step_definitions/calculator_steps.rb -3 $

---

# Son adım

![fixme](http://i.imgur.com/WeyN4.png)

Sebebi tahmin edilebilir, `calc.rb` dosya içeriğinin,

	!ruby
	print "1"

---

# Yine yeşillendi ... Hepsi yeşillendi

`calc.rb` dosya içeriğini şöyle güncellersek,

	!ruby
	print "4"

Tümünün yeşillendiği görülecektir,

![fixme](http://i.imgur.com/nq7pz.png)

---

# Scenario Outline

---

# Çok girdi için genişlet

Şöyle başladık,

.code: code/first_taste/01/features/adding.feature

`Examples` kalıbı yardımıyla test uzayını genişletelim,

.code: code/first_taste/09/features/adding.feature

Test edelim: `$ cucumber`

---

# Cucumber

![fixme](http://i.imgur.com/TRwzB.png)

- hatayı gidermek için `calc.rb`'yi güncelle,

.code: code/first_taste/10/calc.rb -1 $

---

# Cucumber: tamamı yeşillendi

![fixme](http://i.imgur.com/AP3wP.png)

---

# Chapter 3: Gherkin Basics

.code: code/gherkin_basics/sample.feature

---

# 3.2 Format and Syntax
## Keywords

Gherkin anahtar kelimeleri

	!feature
	Feature
	Background
	Scenario
	Given
	When
	Then
	And
	But
	*
	Scenario Outline
	Examples

**Anahtar kelimeler insan içindir, Cucumber göz ardı eder**

---

# 3.4 Scenario

Scenarios all follow the same pattern:

1. **context**: Get the system into a particular state.
2. **action**: Poke it (or tickle it, or ...).
3. **outcome**: Examine the new state.

Örnek,

	!ruby
	Scenario: Successful withdrawal from an account in credit
	  Given I have $100 in my account # the context
	  When I request $20 		# the event(s)
	  Then $20 should be dispensed 	# the outcome(s)

So, we use

- `Given` to set up the **context** where the scenario happens,

- `When` to **interact** with the system somehow, and

- `Then` to check that the **outcome** of that interaction was what we expected.

---

# Chapter 4: Step Definitions
## :From the Outside

Örnek

	!ruby
	Given I have $100 in my Account

Step tanımında şunların yapılması gerekir,

- daha önceden oluşturulmadıysa, bir account oluştur
- kasasına 100$ koy

---

# Step definitions are translators

![fixme](http://i.imgur.com/IastL.png)
