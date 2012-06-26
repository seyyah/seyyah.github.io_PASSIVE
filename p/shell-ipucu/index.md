# Shell: İpucu

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/shell-ipucu

---

# Rename multiple files

Dosya isminde bul-değiştir,

	```sh
	for FILE in *.feature ; do
		NEWFILE=`echo $FILE | sed 's/\.feature/_steps.rb/g'` ;
		echo "$FILE will be renamed as $NEWFILE" ;
		mv "$FILE" $NEWFILE ;
	done
	```

Kaynak:
<http://www.basicallytech.com/blog/?/archives/10-Shell-stuff-rename-multiple-files-on-the-command-line.html>
