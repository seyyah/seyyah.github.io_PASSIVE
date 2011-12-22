Birden fazla sayfada tekrar eden veya modülerlik amacıyla ayrı tutulmasını
istediğimiz HTML içeriği.  Kaynaklar `*.liquid` dosyalarındadır.  Liquid
şablonlama sistemi üretilen HTML kodunda çok fazla boşluk bırakabildiğinden ve
bu boşlukların azaltılması için bir olanak sunmadığından sitede kullanılacak
asıl şablon Rakefile yoluyla `.liquid` uzantısı bulunmayan dosyalarda
üretilmektedir.  Kaynağı `foo.liquid` olan bir şablon `{% include html/foo %}`
komutuyla kullanılır.

DİKKAT!  Sadece `.liquid` uzantılı dosyaları değiştirin ve bu dosyalardaki
değişikliklerin etkin olması için `rake` komutunu çalıştırın.
