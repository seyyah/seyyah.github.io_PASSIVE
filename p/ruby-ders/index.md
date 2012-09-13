# Ruby: Ders

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/ruby-ders

---

# Bölüm 1: INTRODUCTION

<img src="http://i.imgur.com/5QnK9.png" height="500">

---

# Genel

- dinamik programlama dilidir

> - dinamik mi? derlemeli mi?
> - kod ekleme

- Lisp, Smalltalk, Perl'den ilham alır FAKAT

> - List: LISt Processing

- C'nin kolaylığında grameri vardır

---

# Hello

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051964496608018680000df'
	src='http://shelr.tv/records/5051dab29660801890000016/embed'
></iframe>

---

# Ruby Turu: OOP

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051964496608018680000df'
	src='http://shelr.tv/records/5051db1e9660801890000017/embed'
></iframe>

---

# Ruby Turu: Bloklar ve Iteratorler

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051db1e9660801890000017'
	src='http://shelr.tv/records/5051dcb796608010b3000022/embed'
></iframe>

---

# Ruby Turu: İfadeler ve İşleçler

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051db1e9660801890000017'
	src='http://shelr.tv/records/5051de1e96608010b3000025/embed'
></iframe>

---

# Ruby Turu: Yöntemler

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051db1e9660801890000017'
	src='http://shelr.tv/records/5051de9c966080189000001e/embed'
></iframe>

---

# Ruby Turu: Atama

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051db1e9660801890000017'
	src='http://shelr.tv/records/5051dfac96608010b3000026/embed'
></iframe>

---

# Ruby Turu: Punctuation

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051db1e9660801890000017'
	src='http://shelr.tv/records/5051e094966080189000001f/embed'
></iframe>

- fonksiyon tanımında `!` ve `?` sıklıkla kullanılır

- öntakı olarak `$` (global değişken), `@` (instance değişkeni) ve `@@` (class değişkeni) kullanılır

---

# Ruby Turu: Regexp ve Range

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051db1e9660801890000017'
	src='http://shelr.tv/records/5051e3039660801890000020/embed'
></iframe>


---

# Ruby Turu: Class ve Modüller

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051db1e9660801890000017'
	src='http://shelr.tv/records/5051e41b96608010b3000029/embed'
></iframe>

---

# IRB

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051db1e9660801890000017'
	src='http://shelr.tv/records/5051e6ef96608010b300002c/embed'
></iframe>

- nokta-`.`: class/modül ile yöntemi ayırır

- diyez-`#`: instance yöntemi

- iki nokta-`::`: class yöntemi

---

# Müfredat

1. Hafta: bugün

2. Hafta: karakter kümesi, rezerve kelimeler

3. Hafta: veri türleri

4. Hafta: ifadeler, işleçler

5. Hafta: koşul, döngü

6. Hafta: proc ve lambda; closure, fonksiyonel programlama

7. Hafta: class ve module

8. Hafta: metaprogramlama

9. Hafta: en önemli kitaplıklar

10. Hafta: üst düzey Ruby programlama: global değişkenler vs

---

# Bölüm 2: Genel

<img src="http://i.imgur.com/1AhcK.png" height="500">

---

# Yorum

Yorum satırları diyez-`#` ile başlatılır

    !ruby
    # Bu satırın tamamı yorum satırıdır
    x = "#Bu bir katardır" 		    # bu ise yorumdur
    y = "/#bu düzenli ifadedir/"	# bu diğer bir yorumdur

---

# Yardım gömme

Markdown'a benzer bir stili vardır,

    !ruby
    #
    # = Başlık 1
    # == Başlık 2
    #
    # Liste,
    # * foo
    # * bar
    #
    # Yazılar stillendirilebilir _eğik_, *koyu* veya +kod+

---

# Sabitler

Sabitler,

    !ruby
    1         # Tamsayı
    1.0       # Gerçel sayı
    'one'     # Dizgi
    "one"     # Dizgi
    /one/     # Düzenli ifade

---

# İsimlendirme Kuralı

- isimler: değişken, yöntem, sınıf vs

- harf, sayı ve alt çizgi; sayıyla başlayamaz!

- küçük-BÜYÜK harf **farklıdır**.

- Türkçe'ye özel karakter kullanabilirsiniz

Örnekler,

    !ruby
    # GEÇERLİ
    i
    x2
    eski_deger
    _internal
    PI

    # GEÇERSİZ
    1x
    foo bar
    foo%bar

---

# Özel karakterler

İzin verilen özel karakterler,

    !ruby
    $files    # Global değişken
    @data     # instance değişkeni
    @@counter # class değişkeni
    empty?    # Yöntem, mantıksal değer döndürür
    sort!     # Solunu (in-place) günceller
    timeout=  # Atama

---

# Anahtar kelimeler

![](http://i.imgur.com/v46KF.png)

bunları kullanmayın.

---

# Beyaz Boşluklar

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051db1e9660801890000017'
	src='http://shelr.tv/records/5051f02096608010b3000031/embed'
></iframe>

---


# Beyaz Boşluklar + Fonksiyonlar

- Fonksiyonları çağırırken parantez zorunlu değildir

- FAKAT dikkatli olmakta yarar var!

Örnek çalışma,

    !ruby
    def f(x)
      x**2
    end

    p(5)           # => 5**2 => 25
    p 5            # => 5**2 => 25
    p f(3+2) + 1   # => 25 + 1 => 26
    p f (3+2) + 1  # =>
    p f((3+2) + 1) # => ((3+2) + 1) => 6; f(6) => 36

- **Not**: `return` kullanmaksızın en son ifade geri döndürülür

---

# Program Kalıpları/Yapıları

Basit/İlkel İfadeler,

- Ruby söz diziminin en basit birimi: **deyim** (expression)

- deyim yürütüldüğünde değer üretir

- sayı ve dizgi sabitleri ilkel deyimlerdir

- bunlara `true-false-nil-self`'i de ekleyebiliriz

Daha üst düzey yapılar: diziler, hash, range

    !ruby
    [1, 2, 3]                        # Dizi
    { tr: "Türkiye", de: "Almanya" } # Hash
    1..10                            # Range

İşleçler devreye girer,

    !ruby
    1          # ilkel deyim
    x          # ilkel deyim
    x = 1      # atama deyimi
    x = x + 1  # iki işleçli deyim

---

# İfade X Deyim

Koşul ve döngü **ifade**leri (statement) ile birleştirilebilir

    !ruby
    if x < 10 then  # Eğer bu deyim doğruysa
      x = x + 1     # bu ifadeyi yürüt
    end             # koşul sonu

    while x < 10 do # Bu deyim doğru olduğu sürece ...
      print x       # Bu ifadeyi yürüt
      x = x + 1     # + bu ifadeyi de yürüt
    end             # döngü sonu

---

# Bloklar

İki biçimi vardır: `{...}` veya `do ... end`.

    !ruby
    3.times { print "Ruby!" }

    1.upto(10) do |x|
      print x
    end

---

# Karakter Kodlama

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051db1e9660801890000017'
	src='http://shelr.tv/records/5051f6139660801890000023/embed'
></iframe>

- diyez ile başlayan satırlar _shebang comment_ olarak bilinir

---

# Bölüm 3: Veri Türleri ve Nesneler

<img src="http://i.imgur.com/Wlnp3.png" height="500">

---

# Template

<iframe border='0' scrolling='no' style='border: 0'
	width='570' height='418'
	id='shelr_record_5051db1e9660801890000017'
	src='http://shelr.tv/records//embed'
></iframe>
