#---
# Excerpted from "The Cucumber Book",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/hwcuc for more book information.
#---
cp -R 00 01
cd 01
patch --no-backup-if-mismatch -p3 < ../01.diff

bundle install
bundle exec rails generate cucumber:install

cat << 'EOF' > features/see_messages.feature
Feature: See Messages
  Scenario: See another user's messages
    Given there is a User
    And the User has posted the message "this is my message"
    When I visit the page for the User
    Then I should see "this is my message"
EOF

echo "--no-source" > build_options

../../../script/build-cukes
