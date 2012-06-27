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

---

# 5.5 Doc Strings

Feature,

    !ruby
    Scenario: Ban Unscrupulous Users
      When I behave unscrupulously
      Then I should receive an email containing:
        """
        Dear Sir,

        Your account privileges have been revoked due to your unscrupulous behavior.
        Sincerely,
        The Management
        """
      And my account should be locked

---

# 5.6 Tags and Subfolders

Features dizininde alt dizinler oluşturulabilir,

    !bash
    features/
      admins/
      logged_in_users/
      report_building/
      user_administration/
      reading_reports/

Bu alt klasörde ki features'u çalıştırmak için,

    !bash
    $ cucumber features/reading_reports/widget_report.feature

step tanımlarını tek bir yerde tutacaksanız (ki tavsiye edilen budur),

    !bash
    $ cucumber features/reading_reports/widget_report.feature -r features/

root klasörünü hatırlat ki `features/step_definitions/` a baksın

---

# Tags

- Alt klasörler eğer kitabın bölümleriyse,

- Tag'ler sayfalara yerleştirilen not kağıtlarıdır

Test sırasında şöyle belirtilecek

    !bash
    $ cucumber --tags @javascript

---

# Tags: Örnekler

Tag örnekleri,

    !ruby
    @widgets
    Scenario: Generate report
      Given I am logged in
      And there is a report "Best selling widgets"

Birden fazla tag,

    !ruby
    @slow @widgets @nightly
    Scenario: Generate overnight report
      Given I am logged in
      And there is a report "Total widget sales history"

Senaryo düzeyinde tag'leme,

    !ruby
    @nightly @slow
    Feature: Nightly Reports
      @widgets
      Scenario: Generate overnight widgets report
        ...
      @doofers
      Scenario: Generate overnight doofers report
        ...

---

# Chapter 6: When Cucumbers Go Bad

Tarandı fakat not tutulmadı

---

# Part II - A Worked Example

---

# Chapter 7: Step Definitions: On the Inside

.code: code/step_definitions_inside/01/features/cash_withdrawal.feature

**Step 1:** <font color=red>KIRMIZI</font>,

.code: code/step_definitions_inside/01/features/step_definitions/steps.rb 9 11

**Test Sonucu**:

<img src=http://i.imgur.com/nhwxb.png height="200">

**Problem**: `uninitialized constant Account (NameError)`

---

# 7.1 Sketching Out the Domain Model

Step dosyasına **Model** bilgisini gömelim,

.code: code/step_definitions_inside/02/features/step_definitions/steps.rb 9 16

**Step 1:** <font color=green>YEŞİL</font>,

<img src=http://i.imgur.com/JoWqT.png height="200">

**Problem**: `Pending` + `amount`

---

# Model: attribute

**Step 2:** <font color=red>KIRMIZI</font>: `amount`'u dikkate al,

.code: code/step_definitions_inside/03/features/step_definitions/steps.rb 9 17

**Test Sonucu**: değişmedi. İyileştirmeye devam edelim.

---

# Model: method

**Step 2:** <font color=red>KIRMIZI</font>: `balance` yöntemi ekle + `RSpec`

**Step 1:** tekrar <font color=red>KIRMIZI</font>,

.code: code/step_definitions_inside/04/features/step_definitions/steps.rb 9 22

<img src=http://i.imgur.com/oSD9L.png height="200">

---

# RSpec

Kontrolde kullanılan RSpec kodları,

.code: code/step_definitions_inside/04/features/step_definitions/steps.rb 19 21

mealen der ki,

> `balance` değişkeni (yöntem dönütü), `amount` olmalıdır (`should`)

---

# Model: iç değişken

Model'e `@balance` iç değişkeni ekleyelim,

.code: code/step_definitions_inside/05/features/step_definitions/steps.rb 9 17

**Test Sonucu**:

<img src=http://i.imgur.com/qBIiW.png width="700">

---

# 7.2 Removing Duplication with Transforms

---

# Transform

- Tekrarlayan `to_i`'ler göz tırmalıyor

- Bunun için Step tanımında `Transform` tanımlayalım,

.code: code/step_definitions_inside/06/features/step_definitions/steps.rb 19 21

- Artık `to_i`'siz yazabiliriz

.code: code/step_definitions_inside/06/features/step_definitions/steps.rb 23 28

- `Transform`, herhang bir yerde tanıma uyan düzenli ifadeyi yakalar ve çevirir

---

# Transform: Alias / Constant

Bir sabit olarak tanımlayıpta kullanabiliriz,

.code: code/step_definitions_inside/07/features/step_definitions/steps.rb 19 28

`CAPTURE_A_NUMBER` yerine `CAPTURE_CASH_AMOUNT` daha iyi.

---

# Transforms: how do they work?

<img src=http://i.imgur.com/GUh9m.png height="500">

---

# 7.3 Adding Custom Helper Methods

En son test durumumuz,

<img src=http://i.imgur.com/TVfB2.png width="700">

Step en son şöyle idi,

.code: code/step_definitions_inside/09/features/step_definitions/steps.rb 30 32

Transform+Constant kullanarak Step'i tekrardan yazalım,

.code: code/step_definitions_inside/09_10/features/step_definitions/steps.rb 30 32

---

# Model: Teller

Banka memuru (_teller_), hesabımızdan çeksin (_withdraw_),

.code: code/step_definitions_inside/10_pre/features/step_definitions/steps.rb 35 38

madem _request_ yerine _withdraw_ kullanıyoruz Feature'u güncelleyelim (`I
request` > `I withdraw`),

.code: code/step_definitions_inside/10/features/cash_withdrawal.feature

Bunun step'ini güncelleyelim,

.code: code/step_definitions_inside/10/features/step_definitions/steps.rb 35 38

---

# Teller: withdrawal_from

Teller için `withdrawal_from` yöntemini oluştur,

.code: code/step_definitions_inside/10/features/step_definitions/steps.rb 19 22

**Test Sonucu**:

<img src=http://i.imgur.com/5gOqf.png width="700">

**Problem**: `my_account`: step'ler arasında nasıl taşıyacağız?

---

# Storing State in the World

instance'a dönüştrmek gerek (normal ruby davranışı),

.code: code/step_definitions_inside/10_11/features/step_definitions/steps.rb 28 38

**Test Sonucu**:

<img src=http://i.imgur.com/or4yp.png width="700">

---

# Creating Custom Helper Methods

`my_account`'u accessor'un arkasına gizleyerek `nil`'i önleyebiliriz,

.code: code/step_definitions_inside/11/features/step_definitions/steps.rb 29 31

Bir modüle dönüştürebiliriz,

.code: code/step_definitions_inside/11/features/step_definitions/steps.rb 28 32

Cucumber dünyasına (_World_) bunu mixed ederek söyleriz,

.code: code/step_definitions_inside/11/features/step_definitions/steps.rb 34

---

# Creating Custom Helper Methods: Step

Step'leri tekrar güncelle (`@my_account > my_account`),

.code: code/step_definitions_inside/11/features/step_definitions/steps.rb 36 45

---

# Altın vuruş zamanı

Son Step,

.code: code/step_definitions_inside/11/features/step_definitions/steps.rb -3 $

Önce Transform:Constant'ını devreye alalım,

.code: code/step_definitions_inside/11_12/features/step_definitions/steps.rb -3 $

Şöyle yazabiliriz,

.code: code/step_definitions_inside/12/features/step_definitions/steps.rb -3 $

---

# Module: cash_slot

Module'e (`module KnowsTheDomain`) `cash_slot`'u ekleyelim,

.code: code/step_definitions_inside/12/features/step_definitions/steps.rb 39 41

Tahmin edileceği üzere bir de bankomat sınıfı/modeli gerekiyor,

.code: code/step_definitions_inside/12/features/step_definitions/steps.rb 24 28

bir exception atıyor. **Test Sonucu**:

<img src=http://i.imgur.com/WWKa9.png width="700">

**Problem**: `I'm empty! (RuntimeError)`

---

# Teller: initialize + withdrawal_from

Teller şöyleydi,

.code: code/step_definitions_inside/12/features/step_definitions/steps.rb 19 22

ihtiyacı karşılayacak biçimde geliştirelim,

.code: code/step_definitions_inside/13/features/step_definitions/steps.rb 19 27

---

# Step

Step'in önceki hali,

.code: code/step_definitions_inside/12/features/step_definitions/steps.rb 52 55

güncellersek,

.code: code/step_definitions_inside/13/features/step_definitions/steps.rb 65 67

`teller` accessor üzerinden erişilecek,

.code: code/step_definitions_inside/13/features/step_definitions/steps.rb 52 54

---

# CashSlot

CashSlot önceden,

.code: code/step_definitions_inside/12/features/step_definitions/steps.rb 24 28

yeni hali,

.code: code/step_definitions_inside/13/features/step_definitions/steps.rb 29 37

---

# Timü yeşillendi...

![f](http://i.imgur.com/IqPlN.png)

---

# 7.4 Organizing the Code

- uygulama domain'ine dair modeller `lib` dizinine

- `KnowsTheDomain` modülü kendi dosyasına taşınacak

- `Transform` kendi dosyasına taşınacak

- Step dosyası bölünecek

---

# Separating the Application Code

- Uygulamaya dair kodlar: `Account`, `Teller`, `CashSlot`

- bunları `lib/nice_bank.rb`'ye taşı

    + Rails'de buna gerek yok!

- step dosyasında yolu belirt,

.code: code/step_definitions_inside/14/features/step_definitions/steps.rb 9

- bu der ki `./../../lib/nice_bank.rb`'ye de bak/require et.

---

# Booting the Cucumber Environment

- cucumber başlamadan önce `features/support` klasörü altında ki dosyaları da yükler.

- Step tanımlarına destek/support buradan gelecek.

- uygulama kodlarına da erişmek hedeflediğimizden `support/env.rb`'de,

.code: code/step_definitions_inside/15/features/support/env.rb 9

---

# Transforms and World Module

- Transforms: `support/transforms.rb`

- World Module: `support/world_extensions.rb`

---

# Organizing Our Step Definitions

- her bir model/domain başına bir dosya oluşturarak organize et

- Bu durumda,

        !bash
        features/step_definitions/account_steps.rb
        features/step_definitions/teller_steps.rb
        features/step_definitions/cash_slot_steps.rb

- hızlı bakış: `cucumber --dry-run`

---

# Chapter 8: Support Code

Önceki bölümün Automated Teller Machine (ATM) feature,

.code: code/support_code/01/features/cash_withdrawal.feature

---

# 8.1 Fixing the Bug

Kasa'dan düşen böyle sınanıyor,

.code: code/support_code/01/features/step_definitions/teller_steps.rb 9 $

Feature,

.code: code/support_code/01/features/cash_withdrawal.feature

tanımında hesabımda kalanla ilgili eksiklik var! `80$`'ımın kaldığını nasıl test
edeceğim?

.code: code/support_code/02/features/cash_withdrawal.feature 1 5

.code: code/support_code/02/features/cash_withdrawal.feature 7

---

# Missing Senaryo

Buna,

.code: code/support_code/02/features/cash_withdrawal.feature 7

dair adım,

.code: code/support_code/02/features/step_definitions/account_steps.rb 9 $

---

# Gerekli adım

Böyle başladık,

.code: code/support_code/02/features/step_definitions/account_steps.rb -3 $

şöyle yapıyoruz,

.code: code/support_code/03/features/step_definitions/account_steps.rb -4 $

**Test Sonucu**:

![f](http://i.imgur.com/biwjU.png)

**Problem**: `Expected the balance to be 80 but it was 100`

---

# Modeli güncelle

Modelimiz şöyleydi,

.code: code/support_code/03/lib/nice_bank.rb 19 26

şöyle güncelliyoruz,

.code: code/support_code/04/lib/nice_bank.rb 19 27

burada kritik satır: `account.debit(amount)`

---

# debit

**Test Sonucu**:

![f](http://i.imgur.com/LOlRc.png)

Kritik satır: `undefined method `debit' for #<Account ...>`. Bu satırı
tetikleyen feature satırı,

.code: code/support_code/04/features/cash_withdrawal.feature 4

buna ait step,

.code: code/support_code/04/features/step_definitions/teller_steps.rb 9 $

burada `my_account`,

.code: code/support_code/04/features/support/world_extensions.rb 10 12

---

# Account modeli: debit

dolayısıyla `my_account`, Account instance'ıdır.

.code: code/support_code/04/features/step_definitions/teller_steps.rb 10

ve `teller`'da bir Teller instance'ı olduğundan, `withdrawal_from` işlevinde,

.code: code/support_code/04/lib/nice_bank.rb 23 26

`account.debit` çağrısı Account modelinde `debit` (deftere kaydedilen borç)
yöntemini arar. Bulamayınca: `undefined method 'debit' for #<Account ...>`

Ki `Account` modeli,

.code: code/support_code/04/lib/nice_bank.rb 9 17

---

# Account modeli: debit: eklentisi

Başlarken,

.code: code/support_code/04/lib/nice_bank.rb 9 17

`debit`'le,

.code: code/support_code/05/lib/nice_bank.rb 9 19

---

# Tümü yeşillendi

**Test Sonucu**:

![f](http://i.imgur.com/WOEzq.png)

---

# Reviewing and Refactoring

Extreme Programming Explained kitabında Kent Beck, basit tasarımla alakalı
olarak dört kriter belirlemiştir,

1. Tüm testler geçmeli

2. Niyetin açık olsun

3. Tekrarları önle

4. En az sayıda nesne veya yöntem kullan

![f](http://www.extremeprogramming.org/map/images/project.gif)

---

# Bizde durum nedir?

1. "Tüm testler geçmeli". EVET

2. "Niyetin açık olsun". Bu biraz sıkıntılı!

3. ?

4. ?

---

# XP: Niyetin açık olsun

## Feature: Step 1

- Feature hatırlanırsa

.code: code/support_code/05/features/cash_withdrawal.feature 2

- `deposit` X `withdraw` yoksa `credit` X `debit`

- finansal işlemlerde `credit` (Cr) ve `debit` (Dr) kullanıldığından

- `deposit -> credit` geçişi yapıyoruz

- **debit card**: kişinin kendi parasıyla alış veriş yapması

- **credit card**: ödünç parayla alış veriş yapması

---

# deposit -> credit geçişi: Model

Model (önce),

.code: code/support_code/05/lib/nice_bank.rb 9 12

Model (sonra),

.code: code/support_code/06/lib/nice_bank.rb 9 12

---

# deposit -> credit geçişi: Step

Step (önce),

.code: code/support_code/06/features/step_definitions/account_steps.rb 9 10

Step (sonra),

.code: code/support_code/07/features/step_definitions/account_steps.rb 9 10

---

# Feature: Step 2

Feature (önce),

.code: code/support_code/07/features/cash_withdrawal.feature 3

Feature (sonra),

.code: code/support_code/08/features/cash_withdrawal.feature 3

Buna dair Step (önce),

.code: code/support_code/06/features/step_definitions/account_steps.rb 9 10

Step (sonra),

.code: code/support_code/08/features/step_definitions/account_steps.rb 9 10

---

# XP: "Tekrarları önle"

Bu iki adım,

.code: code/support_code/08/features/step_definitions/account_steps.rb 9 $

Evet... kod tekrarı içeriyor fakat zaten ilk adım, görevi olmayan işe girişmiş,

.code: code/support_code/09/features/step_definitions/account_steps.rb 9 $

---

# 8.2 Bootstrapping the User Interface

- Sinatra ve Capybara

- TODO: 141-142 sayfalarında Sinatra nasıl?

---

# What skills do you need to write tests?

<img src=http://i.imgur.com/Q1KxX.png height=550>

---

# 8.3 Making the Switch

Amacımız,

<img src=http://i.imgur.com/xyEaO.png height=550>

---

# world_extensions ui

Peki nasıl? İlgili step'te teller (kasiyer)'in hesaptan nasıl düşeceğini
bilmiyoruz,

.code: code/support_code/11/features/step_definitions/teller_steps.rb 9 11

Bunun UI ile yaptıracağız. world_extensions (önce),

.code: code/support_code/11/features/support/world_extensions.rb 9 12

world_extensions (sonra),

.code: code/support_code/12/features/support/world_extensions.rb 9 17

---

# world_extensions ui: test

**Test Sonucu**:

![f](http://i.imgur.com/VVH9O.png)

Neden? İlgili Step,

.code: code/support_code/12/features/step_definitions/cash_slot_steps.rb 9 11

burada `cash_slot`, CashSlot türünden,

.code: code/support_code/12/features/support/world_extensions.rb 19 21

---

# cash_slot

Bu ise bir önceki adımda,

.code: code/support_code/12/features/step_definitions/teller_steps.rb 9 11

teller üzerinden,

.code: code/support_code/12/features/support/world_extensions.rb 23 25

`UserInterface` sınıfı/modelinin `withdrawal_from` işlevi,

.code: code/support_code/12/features/support/world_extensions.rb 9 13

Yani, hiç bir şey yapmıyor!

---

# UI: withdrawal_from

UI:withdrawal_from (önce),

.code: code/support_code/12/features/support/world_extensions.rb 9 13

withdrawal_from (sonra,

.code: code/support_code/13/features/support/world_extensions.rb 9 19

---

# UI: view

**Test Sonucu**:

![f](http://i.imgur.com/6iB5X.png)

Fill edilecek bir şey yok. UI:view, böyle bir şey olmalı,

![f](http://i.imgur.com/VbeTv.png)

---

# Hooks

Senaryonun başında ve sonunda bir şeyler yapmak istersek: `hooks`

    !ruby
    # features/support/hooks.rb
    Before do
      puts "Go!"
    end

    After do
      puts "Stop!"
    end

Bu haliyle global'dir, belli tag'ler için özelleştirebilirsiniz,

    !ruby
    # foo.feature
    ...
    @admin
    Feature: Delete Widgets
      ...

    # hooks.rb
    Before('@admin') do
      user = create_user(:admin => true)
      login_as user
    end

---

# Hooks: scenario, around

Examining the Scenario,

    !ruby
    Before do |scenario|
      puts "Starting scenario #{scenario.name}"
    end

    After do |scenario|
      puts "Oh dear" if scenario.failed?
    end

Around Hooks,

    !ruby
    Around do |scenario, block|
      puts "About to run #{scenario.name}"
      block.call
      puts "Finished running #{scenario.name}"
    end

    Around('@run_with_and_without_javascript') do |scenario, block|
      Capybara.current_driver = Capybara.javascript_driver
      block.call
      Capybara.use_default_driver
      block.call
    end

---

# Building the User Interface

Önce debugging kodu eklemekle başla,

.code: code/support_code/14/features/support/debugging.rb -3 $

Burada kritik gem `launchy`, hata durumunda browser açılır. Gemfile'ı ayarla,

.code: code/support_code/14/Gemfile

TODO: sayfa 150-156

---

# Chapter 9: Message Queues and Asynchronous Components

TODO: sayfa 157-172

---

# Chapter 10: Databases

TODO: sayfa 173-190

---

# Chapter 11: The Cucumber Command-Line Interface

TODO: 191-200

---

# Chapter 12: Testing a REST Web Service

TODO: 201-220

---

# Chapter 13: Adding Tests to a Legacy Application

TODO: 221-228

---

# Chapter 14: Bootstrapping Rails

Hikaye/senaryo şöyle başlar,

> I’ve got an amazing idea! We’re going to build a blogging platform, a micro-
> blogging platform. It’s like blogging, right, but your messages are limited to
> 140 characters. So, you could send them from a phone even! This is going to
> change the world! We’re going to call it...Squeaker.

İlk feature yazılır,

.code: code/rails/01/features/see_messages.feature

---

# Rails

Rails uygulamanı oluştur,

    !bash
    $ rails new squeaker --skip-test-unit

Gemfile'ını düzenle,

.code: code/rails/01/Gemfile

---

# Cucumber

ilk adımlar,

    !bash
    $ cd squeaker
    $ rails generate cucumber:install

Generator'ün oluşturduğu üç kritik dosya var,

- `config/cucumber.yml`: profiller burada. Öntanımlı olarak: `default, wip,
  rerun` geliyor. Bkz: "11.6 Using Profiles",
  <https://github.com/cucumber/cucumber/wiki/cucumber.yml>

- `features/support/env.rb`: testler başladığında **önce** bu çalıştırılır.
  Rails ortamını, gereksinimleri (Cucumber, Capybara kitaplıkları vs) yükler.

- `lib/tasks/cucumber.rake`: Rake görevleri. `$ rake -T cucumber`. Bkz: "11.7
  Running Cucumber from Rake",
  <https://github.com/cucumber/cucumber/wiki/Using-Rake>

---

# Feature

- Feature,

.code: code/rails/01/features/see_messages.feature

- İlk adım,

.code: code/rails/01/features/see_messages.feature 3

- **Test** edelim: `$ cucumber`

![f](http://i.imgur.com/n9YkV.png)

- User oluşturmalıyız.

---

# Step 1: Creating a User

- FactoryGirl'ü kullanacağız (sign-up vs girmiyoruz),

.code: code/rails/02/Gemfile 15 $

.notes: FactoryGirl ise rails uygulamaları için `factory_girl_rails`'i öneriyor.

- Adım tanımını oluşturalım,

.code: code/rails/02/features/step_definitions/user_steps.rb -3 $

.notes: burada `Factory(:user)`, `Factory.create(:user)` kısaltmasıdır. Bunu kullanın.

- **Test** edelim: `$ cucumber`

![f](http://i.imgur.com/K35V6.png)

---

# Step 1: FactoryGirl

- FactoryGirl

.code: code/rails/03/features/support/factories.rb 9 $

.notes: her bir factory tanımı ayrı dosyada ve `test/factories/*.rb` olarak tutuluyor.

.notes: Cucumber'in FactoryGirl'ü görebilmesi için, `features/support/env.rb`'de `require 'factory_girl'` yeterli!

- **Test** edelim: `$ cucumber`

![f](http://i.imgur.com/JFUx8.png)

---

# Step 1: Model

- `User` modeli,

        !bash
        $ rails generate model User username:string

- migrate + prepares,

        !bash
        $ rake db:migrate db:test:prepare

- **Test** edelim: `$ cucumber`

![f](http://i.imgur.com/IIKpk.png)

- Step 1: YEŞİL

- Step 2: SARI/UNDEFINED

---

# Step 2: Posting a Message

- İlgili Feature girdisi,

.code: code/rails/05/features/see_messages.feature 4

- Adım tanımını oluşturalım,

.code: code/rails/05/features/step_definitions/user_steps.rb -4 $

- **Test** edelim: `$ cucumber`

![f](http://i.imgur.com/DeLXP.png)

---

# Step 2: FactoryGirl

- FactoryGirl,

.code: code/rails/06/features/support/factories.rb 16 19

- **Test** edelim: `$ cucumber`

![f](http://i.imgur.com/BTsjC.png)

---

# Step 2: Model

- `Message` modeli,

        !bash
        $ rails g model Message user_id:integer content:string

- migrate + prepares,

        !bash
        $ rake db:migrate db:test:prepare

- **Test** edelim: `$ cucumber`

![f](http://i.imgur.com/b38gU.png)

---

# Step 2: Association

- Model'de user - message ilişkisini kur,

.code: code/rails/08/app/models/message.rb -3 $

- **Test** edelim: `$ cucumber`

![f](http://i.imgur.com/9bpwQ.png)

- STEP 2: YEŞİL

- STEP 3: SARI/UNDEFINED

---

# Step 3: Visit

- İlgili Feature girdisi,

.code: code/rails/09/features/see_messages.feature 5

- Adım tanımını oluşturalım,

.code: code/rails/09/features/step_definitions/user_steps.rb -4 $

- **Test** edelim: `$ cucumber`

![f](http://i.imgur.com/MhHVc.png)

---

# Step 3: Controller


