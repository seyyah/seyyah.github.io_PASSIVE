Feature:
  Scenario: Withdraw fixed amount of $50
    Given I have $500 in my account
    Given I have authenticated with the correct PIN
    When I choose to withdraw the fixed amount of $50
    Then I should receive $50 cash
    And the balance of my account should be $450

