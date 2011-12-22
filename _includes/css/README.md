Birden fazla CSS dosyada tekrar eden veya modülerlik amacıyla ayrı tutulmasını
istediğiniz CSS içeriği.  Kaynaklar `*.css` dosyalarındadır.  Sitede
kullanılacak minimize edilmiş CSS, Rakefile yoluyla `.css` uzantısı bulunmayan
dosyalarda üretilmektedir.  Kaynağı `foo.css` olan bir CSS `{% include css/foo
%}` komutuyla kullanılır.

CSS minimizasyonu için `yui-compressor` kullanılmaktadır.  Programı kurmak için:

            $ sudo apt-get install yui-compressor

DİKKAT!  Sadece `.css` uzantılı dosyaları değiştirin ve bu dosyalardaki
değişikliklerin etkin olması için `rake` komutunu çalıştırın.
