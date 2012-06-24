# Cucumber: İpucu

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/cucumber-ipucu

---

# Tags

Bazı komut örnekleri,

	!bash
	$ cucumber --tags @foo

	# tum tagler
	$ cucumber -f tag_cloud fnm.feature
---
# Tags: Senaryo

Senaryo olarak,

	!feature
	@billing
	Feature: Verify billing

		@important
		Scenario: Missing product description

		Scenario: Several products

---

# Tags: Advanced

Runs **both** scenarios; Runs the **first** scenario;
Runs the **second** scenario (Scenarios without @important)

	!bash
	$ cucumber --tags @billing 		# both
	$ cucumber --tags @important 	# first
	$ cucumber --tags ~@important 	# second

Runs the first scenario (Scenarios with @important **AND** @billing);
Runs both scenarios (Scenarios with @important **OR** @billing)

	!bash
	$ cucumber --tags @billing --tags @important 	# AND
	$ cucumber --tags @billing,@important     		# OR

Cucumber:Wiki [Tags](https://github.com/cucumber/cucumber/wiki/Tags)

---

# Shell

- `Examples` kullanıyorken her bir örneği ayrı ayrı ekrana dökmeyi istersen

		!bash
		$ cucumber --expand

- klasör kullanımı,

		!bash
		$ cucumber features/reading_reports/widget_report.feature -r features/
---

# Okunacaklar Listesi

- [15 Expert Tips for Using Cucumber](http://www.engineyard.com/blog/2009/15-expert-tips-for-using-cucumber/)
