Feature: user have its own profile page
 
  As a registered organizer (user)
  So that I can view or edit my personal informations
  I want to have my own profile page where it shows these informations.

Background: challenges and organizers have been added to the database
  
  Given I am a new, authenticated user

  And the following informations exist:
  | Email                  |   First name   |   Last name   |  Organiztion  | Workbench ID |
  | testuser@testuser.com  |      Test      |      User     |       GE      |      GE      |

  And I am on the User Profile page

Scenario: View profile
    Given I am on the Chalearn's Challenges page
    When I follow "My Profile"
    Then I should be on the User Profile page
    And I should see "testuser@testuser.com"
    And I should see "Test"
    And I should see "User"
    And I should see "GE"
    And I should see "GE"

Scenario: Edit profile
    Given I am on the Chalearn's Challenges page
    When I follow "My Profile"
    Then I should be on the User Profile page
    When I fill in "Email" with "John@GE.com"
    And I fill in "First name" with "John"
    And I fill in "Last name" with "Fox"
    And I fill in "Workbench ID" with "Anonymous"
    And I press "save"

    Then I should be on the User Profile page
    And I should see "John@GE.com"
    And I should see "John"
    And I should see "Fox"
    And I should see "GE"
    And I should see "Anonymous"
    