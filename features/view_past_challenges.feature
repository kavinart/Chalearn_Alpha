Feature: view past challenges
 
  As a registered organizer
  So that I can view all past challenges
  I want to be able to see my past challenges listed in chronological order all in one page

Background: challenges and organizers have been added to the database
  
  Given I am a new, authenticated user

  And the following challenges exist:
  | title                    | description   | start_time   | user_id |
  | Flight path1             | Optimize cost | 25-Nov-1992  |    1    |
  | Flight path2             | Optimize cost | 25-Nov-1992  |    2    |
  | Flight path3             | Optimize cost | 25-Nov-1992  |    2    |
  | Flight path4             | Optimize cost | 25-Nov-1992  |    1    |
  | Flight path5             | Optimize cost | 25-Nov-1992  |    5    |

Scenario: View only my own past challenges
    Given I am on the mychallenges page

    Then I should see "Flight path1"
    And I should see "Flight path4"
    And I should not see "Flight path2"
    And I should not see "Flight path3"
    And I should not see "Flight path5"
