Feature: list all users
 
  As a registered admin
  So that I can view all users in the system
  I want to be view the users in the database with the all the information about my users

Background: registered users have been added to the database
  
  Given I am a new, authenticated moderator

  And the following users exist:
  | email                   | password       | password_confirmation |
  | test@test.com           | 12345678       | 12345678              |
  | test1@test.com          | 12345678       | 12345678              |
  | test2@test.com          | 12345678       | 12345678              |

  And I am on the home page

Scenario: View all the users in the database
    Given I am on the users page
    Then I should see "test@test.com"
    And I should see "test1@test.com"
    And I should see "test2@test.com"