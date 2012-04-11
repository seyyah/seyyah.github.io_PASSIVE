---
layout: post
title: debian upgrade
---

## lenny (5.0) -> squeeze (6.0) upgrade işlemi

1. `/etc/apt/sources.list` dosyasını şöyle güncelle: [sources.list](http://gist.github.com/469391)

2. önce root ol `$sudo -s` ve sonra `$ apt-get update && apt-get upgrade -y &&
apt-get -y dist-upgrade && apt-get clean && apt-get autoclean && apt-get autoremove`
