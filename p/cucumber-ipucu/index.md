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

- [Cucumber Rails 0.4: The
  De-Web-Step-ining](http://www.noelrappin.com/railsrx/2011/3/30/cucumber-rails-04-the-de-web-step-ining.html)

- [UI Tests – How do we keep them from being
  brittle?](http://www.cheezyworld.com/2010/11/09/ui-tests-not-brittle/)
- [Tutorials and Related Blog
  Posts](https://github.com/cucumber/cucumber/wiki/tutorials-and-related-blog-posts)
- [15 Expert Tips for Using Cucumber](http://www.engineyard.com/blog/2009/15-expert-tips-for-using-cucumber/)

## Diğer

- <http://railscasts.com/episodes/275-how-i-test?view=asciicast>
- <http://www.pmamediagroup.com/2009/04/what-netbeans-651-can-now-recognize-my-cucumber-feature-files/>
- <http://www.pmamediagroup.com/2009/04/tutorial-how-to-install-setup-cucumber/>
- <http://robots.thoughtbot.com/post/284805810/gimme-three-steps>
- <http://collectiveidea.com/blog/archives/2010/09/09/practical-cucumber-factory-girl-steps/>

