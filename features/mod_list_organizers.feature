Feature: list all users
 
  As a registered admin
  So that I can view all users in the system
  I want to be view the users in the database with the all the information about my users

Background: registered users have been added to the database
  
  Given I am an authenticated admin

  And the following users exist:
  | email                   | Bench ID      | Organization | user_id |
  | test@test.com           | Test          | Test Org     |    1    |
  | test1@test.com          | Test1         | Test Org 1   |    2    |

  And I am on the Chalearn's Admin page

Scenario: View all the users in the database
    Given I am on the Chalearn's Admin page
    And I follow 'list all users'
    Then I should be on the list users page
    And I should see 'test@test.com'
    And I should see 'test1@test.com'