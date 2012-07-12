
# Cucumber: Prescriptions

.fx: first

Nurettin Şenyer <seyyah@bil.omu.edu.tr>

http://seyyah.me

Haziran, 2012

Samsun

.qr: 150|http://seyyah.me/p/cucuber-prescriptions

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

örnekler,

	Given I visit "sigin" page
	And I fill in "<attribute>" with "<value>"
	When I press "<action>"
	Then I visit "institutions" page
	And I should <result>

	Examples:
	| attribute | value | action | result    |
	| name      | OMÜ   | Create | see "OMÜ" |

---

# Scenario

Örnekler

    !ruby
    I should be able to edit a user
    Change my password
    access before expiry
    access after expiry
    Test how spinach works
    Artist creates an art work
    A new person signs up
    Make tea
    Depositing money in to a User account
    Viewing tickets for a given project
    log in as admin
    User logs in
    User views their dashboard
    Dialog manipulation
    Find a rollover solution
    Linked objects with parent object defined first

---

# Background

Örnekler

    !ruby
    I log in with valid credentials
    I am logged in
    I am a registered artist
    the following restaurants exist

---

# Given ...

Örnekler

    !ruby
    I am on the homepage
    I am a customer
    I am on the account page
    10 users exist
    Given the following users exist
      | name  | activated |
      | Fred  | false     |
      | Ethel | true      |
    I follow the add new artwork link from the dashboard
    I follow the "dashboard" link

---

# When ...

Örnekler

    !ruby
    I visit "/foo"
    I click "Edit this user"
    I press "Update"
    they login in 31 days
    I fill the form with the artwork data
    I upload a picture
    I attach the file at "c:/foo/bar.exe" to "Your mugshot"
    I select "TeraSystems" in the list "#1"
    I select "English" from "Languages"
    I check "Remember me"

---

# Then ...

Örnekler

    !ruby
    they will be asked to renew
    they will be let in
    10 events should exist
    the following users exist:
      | user | name   | activated |
      | Fred | Freddy | false     |
    the email should have subject: "Welcome to pickle",
      from: "pickle@example.com"
    the response body should contain "successfully updated"
    I should have the list "#1" with "TeraSystems" selected
    the "Remember me" checkbox should be checked

---

# Capybara

## Navigating and Clicking links and buttons

    !ruby
    visit articles_path
    click 'Link Text' | click_button | click_link

## Interacting with forms

    !ruby
    attach_file
    fill_in 'First Name', :with => 'John'
    check 'A checkbox'
    uncheck 'A checkbox'
    choose 'A radio button'
    select 'Peter Pan', :from => 'friends'
    unselect

---

# Capybara

## Querying

    !ruby
    page.has_content?
    page.has_css?
    page.has_no_content?
    page.has_no_css?
    page.has_no_xpath?
    page.has_xpath?
    page.has_link?
    page.has_no_link?
    page.has_button?("Update")
    page.has_no_button?
    page.has_field?
    page.has_no_field?
    page.has_checked_field?
    page.has_unchecked_field?
    page.has_no_table?
    page.has_table?
    page.has_select?
    page.has_no_select?

---

# Feature

---

# Feature: User

<script src="https://gist.github.com/3076224.js"> </script>

---

# Feature: Profile

<script src="https://gist.github.com/3074775.js"> </script>

---

# Feature: Sign in

<script src="https://gist.github.com/3074785.js"> </script>

---

# Feature: Sign up

<script src="https://gist.github.com/3074787.js"> </script>

---

# Feature: Forms Steps

<script src="https://gist.github.com/3074853.js"> </script>

---

# Support

---

# Support: Login Steps

<script src="https://gist.github.com/3074811.js"> </script>

---

# Support: Within Helpers

<script src="https://gist.github.com/3074818.js"> </script>

---

# Support: Navigation Helpers

<script src="https://gist.github.com/3074830.js"> </script>

---

# Reusable step definitions + i18n

- <https://github.com/kucaahbe/cucumber-websteps>
- <https://github.com/ryanb/railscasts-episodes/blob/master/episode-159/blog/features/step_definitions/webrat_steps.rb>

## Diğer

- <http://github.com/nando/mundo-pepino>
- <http://github.com/dancroak/blitz>
- <http://github.com/demetriusnunes/swinger>
- <http://github.com/richdownie/watircuke>
- <http://github.com/napcs/cucumber_watir>
- <http://github.com/mdoel/cukesteps>
- <http://github.com/danielwanja/cucumberwithflex>
- <http://github.com/fmiopensource/couchdb-cucumber>

# eBook

- [Pragmatic Bookshelf Publishing Rails Test Prescriptions, Keeping Your
Application Healthy (2010)](#), sayfa 235


<!-- vim: tabstop=2:softtabstop=2:shiftwidth=2:noexpandtab -->
