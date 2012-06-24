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

<img src="http://i.imgur.com/IastL.png" height="500">

---

# 4.1 Steps and Step Definitions

.code: code/step_definitions/intro/features/cash_withdrawal.feature

---

# 4.4 Flexibility: singular x plural

Feature'da yazılan şu iki ifade için,

    !ruby
    Given I have   1 cucumber  in my basket
    Given I have 256 cucumbers in my basket

Step tanımı şöyle olmalıdır,

    !ruby
    Given /I have (\d+) cucumbers? in my basket/ do |number|
      # TODO: code goes here
    end

---

# Alternation

Feature'da yazılan şu iki ifade için,

    !ruby
    When I visit the homepage
    When I go to the homepage

Step tanımı şöyle olmalıdır,

    !ruby
    When /I (?:visit|go to) the homepage/ do
      # TODO: code goes here
    end

---

# How Cucumber executes a scenario

TODO: sayfa 53, figure 5

Burada senaryo için dört duruma dikkat:

- <font color=yellow>Undefined, Pending,</font>
- <font color=red>Failed</font>, <font color=green>Passed</font>

---

# Choosing Your Assertion Library

Step tanımında farklı kitaplık seçenekleri vardır: RSpec, MiniTest, Wrong

    !ruby
    # RSpec
    >> require 'rspec/expectations'
    >> "green".should == "cucumber"
    RSpec::Expectations::ExpectationNotMetError:
      expected: "cucumber"
           got: "green" (using ==)

---

# Chapter 5: Expressive Scenarios

- Önce kurulama yapalım.

- araçlar: `scenario outlines` ve `data tables`

- ve `Background`

---

# 5.1 Background

- Tümüne ait ortak adımlar

- Background'da genelde `Given` (bazen `When`) oluşur
    + Senaryolar üç paternden oluşuyordu: conext, action, outcome (bkz: 3.4
      Scenario)

        * `Given`: context'i oturtmak için
        * `When`: action'ı seçmede
        * `Then`: outcome'ı görmede

---

# Background: before

before,

.code: code/expressive_scenarios/00/background_before.feature

her bir adımda ilk üç satır aynı/ortak

---

# Background: after

after,

.code: code/expressive_scenarios/00/background_after.feature

---

# 5.2 Data Tables

Feature,

.code: code/expressive_scenarios/01/features/tic_tac_toe.feature

---

# Step 01: Pending

Step,

.code: code/expressive_scenarios/01/features/step_definitions/board_steps.rb 9 $

<img src="http://i.imgur.com/7OARZ.png" height="250">

---

# Step 02: Table to Array

Step,

.code: code/expressive_scenarios/02/features/step_definitions/board_steps.rb 9 $

<img src="http://i.imgur.com/lUkDz.png" height="250">

---

# Step 03: Comparing Tables with Diff

Step,

.code: code/expressive_scenarios/03/features/step_definitions/board_steps.rb 9 $

<img src="http://i.imgur.com/FFKSf.png" height="250">

---

# Step 04: Implementation

Step,

.code: code/expressive_scenarios/04/features/step_definitions/board_steps.rb 9 $

<img src="http://i.imgur.com/aNDMI.png" height="250">

---

# 5.3 Scenario Outline

---

# Examples: before

Feature,

.code: code/expressive_scenarios/05/features/examples_before.feature

---

# Examples: after

Feature,

.code: code/expressive_scenarios/06/features/examples_after.feature

---

# Examples: dry

Feature,

.code: code/expressive_scenarios/07/features/examples_dry.feature

---

# Examples: dry: with failure case

Feature,

.code: code/expressive_scenarios/08/features/examples_dry_with_failure_case.feature

Özellikle en **alt** satırda ki hata mesajına bakın.

---

# Examples: Multiple Tables

Feature,

.code: code/expressive_scenarios/09/features/examples_multiple_tables.feature

---

# Examples: Explain Yourself

Feature,

.code: code/expressive_scenarios/10/features/examples_explain_yourself.feature

---

# Examples: Explain Yourself Detaily

Feature,

.code: code/expressive_scenarios/11/features/examples_explain_yourself_detaily.feature

---

# 5.4 Nesting Steps

---

# Nesting Steps: before

Feature,

.code: code/expressive_scenarios/12/features/nesting_steps_before.feature

Burada şu feature tekrarlıyor,

.code: code/expressive_scenarios/12/features/user_login.feature

---

# Nesting Steps: after

Feature,

.coden: code/expressive_scenarios/13/features/nesting_steps_after.feature

`Given I have authenticated with the correct PIN` üst düzey adımına dikkat!

Step'ler şöyle olur,

.code: code/expressive_scenarios/13/features/step_definitions/user_steps.rb 1

    ...

.code: code/expressive_scenarios/13/features/step_definitions/user_steps.rb -7 $

---

# Argümanlar

Step örneği 1: ruby kodu

    !ruby
    Given /^an activated customer (\w+) exists$/ do |name|
      steps %{
        Given I create a customer with login #{name}
        And I register the customer with login #{name}
        And I activate the customer with login #{name}
      }
    end

Data Tables'ı böyle geçebiliriz, +bonus: tek step durumu

    !ruby
    Given /^a (\w+) widget with the following details:$/ do |color, details_table|
      step "I create a #{color} widget with the following details:", details_table
      steps %{
        And I register the #{color} widget
        And I activate the #{color} widget
      }
    end

