Feature: Account Creation
  Scenario Outline: Password validation
    Given I try to create an account with password "<Password>"
    Then I should see that the password is <Valid or Invalid>
  
    Examples: Too Short
      Passwords are invalid if less than 4 characters
  
      | Password | Valid or Invalid |
      | abc      | invalid          |
      | ab1      | invalid          |
  
    Examples: Letters and Numbers
      Passwords need both letters and numbers to be valid
  
      | abc1     | valid            |
      | abcd     | invalid          |
      | abcd1    | valid            |

