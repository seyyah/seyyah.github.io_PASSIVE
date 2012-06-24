Feature:
  Scenario: Successful login with PIN
    Given I have pushed my card in the slot
    When I enter my PIN
    And I press "OK"
    Then I should see the main menu

