# Cucumber: Prescriptions

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/cucuber-prescriptions

---

# eBook

- [Pragmatic Bookshelf Publishing Rails Test Prescriptions, Keeping Your
Application Healthy (2010)](#), sayfa 235

---

# Gherkin

Genel olarak,

	!ruby
	Scenario
	  Given _context_
	  When  _interact_
	  Then  _outcome_

---

# Gherkin: Cümleler

Given I visit "sigin" page
And I fill in "<attribute>" with "<value>"
When I press "<action>"
Then I visit "institutions" page
And I should <result>

Examples:
  | attribute | value | action | result    |
  | name      | OMÜ   | Create | see "OMÜ" |
