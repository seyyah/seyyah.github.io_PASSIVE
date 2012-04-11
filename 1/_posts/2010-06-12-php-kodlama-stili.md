---
layout: post
title: php kodlama stili
---

Kaynak [linki](http://pear.php.net/manual/en/standards.php)nde

## kontrol yapıları

`if`, `for` `while` vs için,

	<?php
	if ((condition1) || (condition2)) {
		action1;
	} elseif ((condition3) && (condition4)) {
		action2;
	} else {
		defaultaction;
	}
	?>

## işlevler

tanımlarken böyle

	<?php
	function fooFunction($arg1, $arg2 = '')
	{
		if (condition) {
			statement;
		}
		return $val;
	}
	?>  

Çağırırken de böyle, yani parantezin öncesi ve sonrasında boşluk YOK,

	<?php
	$var = foo($bar, $baz, $quux);
	?> 
