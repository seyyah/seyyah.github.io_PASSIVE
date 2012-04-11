---
layout: post
title: branch ile çalışmak
---

	$ cd tmp/gt/branchla_calisma/
	$ vim test # duzenle
	$ git add .
	$ git commit -a -m ilk
	$ 
	$ git branch deneysel
	$ git branch -d deneysel
	$ git branch
	$ 
	$ git checkout deneysel
	$ 
	$ vim bar #duzenle
	$ git add .
	$ git commit -a -m branchtan
	$ git checkout master
	$ ls 

`bar` dosyası görülmüyor değil mi? çünkü `deneysel` branch'ında kaldı, bu tarafa almadık (`merge`) henüz. daha başka ne değişiklikler var görmek için 

	$ git diff deneysel

bu değişiklikleri `master`'da birleştirmek için 

	$ git merge deneysel

## çakışma oluşturup idare edelim

iki branch ta aynı dosyada aynı yerlerde değişiklik yapalım. `test` dosyası içeriği "bur bir test dosyası" dır.

	$ git checkout deneysel
	$ vim test 
	> bu iki test dosyası
	$ git commit -a -m "conflict:deneysel"
	$ git checkout master
	$ vim test
	> bu uc test dosyası
	$ git commit -a -m "conflict:master"

şimdi iki branch tan gelenleri `master` da birleştirelim

	$ git checkout master
	$ git merge deneysel
	$ git merge deneysel 
	Auto-merging test
	CONFLICT (content): Merge conflict in test
	Automatic merge failed; fix conflicts and then commit the result.

mealen `test` dosyasında merge işlemi başarısız oldu. o dosyaya git, seçimini yap, tekrar commitle. o dosya içeriğine bir göz atalım,

	<<<<<<< HEAD:test
	bu uc test dosyası
	=======
	bu iki test dosyası
	>>>>>>> deneysel:test

mealen HEAD (master) dosyasında böyle deniyor, deneysel branch ında şöyle deniyor, hangisi olsun. diyelim ki biz ikisini de birleştireceğiz, içerik aşağıdaki gibi

	bu iki/uc test dosyası

kaydedip tekrardan commitle

	$ git commit -a -m "conflict duzeltildi"

