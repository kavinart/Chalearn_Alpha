Feature: Organizer restricted to his own challenges
 
  As a registered organizer
  So that I am restricted access to organizers
  I want to be able to be denied access when attemping to view others' challenges

Background: challenges have been added to the database
  
  Given I am a new, authenticated user

  And the following challenges exist:
  | title                    | description   | start_time   | user_id |
  | Flight path1             | Optimize cost | 25-Nov-1992  |    1    |
  | Flight path2             | Optimize cost | 25-Nov-1992  |    1    |
  | Flight path3             | Optimize cost | 25-Nov-1992  |    2    |
  | Flight path4             | Optimize cost | 25-Nov-1992  |    2    |
  | Flight path5             | Optimize cost | 25-Nov-1992  |    3    |

Scenario: View one of other organizers' challenges
    Given I am on the Chalearn's Challenges page
    Then I go to the details page for "Flight path3"
    Then I should not see "Flight path3"
    And I should be on the home page
    And I should see "Error!"

Scenario: Edit one of other organizers' challenges
    Given I am on the Chalearn's Challenges page
    Then I go to the edit page for "Flight path3"
    Then I should not see "Flight path3"
    And I should be on the home page
    And I should see "Error!"