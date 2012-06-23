Feature: Account Creation
  Scenario Outline: Password validation
    Given I try to create an account with password "<Password>"
    Then I should see that the password is <Valid or Invalid>

    Examples:
      | Password | Valid or Invalid |
      | abc      | invalid          |
      | ab1      | invalid          |
      | abc1     | valid            |
      | abcd     | invalid          |
      | abcd1    | valid            |
