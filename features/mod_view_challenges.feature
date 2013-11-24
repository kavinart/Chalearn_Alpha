Feature: Moderator view challenges
 
  As an registered moderator
  So that I can manage the vast amount of challenges on the site
  I want to be able to see all past challenges regardless of challenge organizer

Background: challenges and organizers have been added to the database
  
  Given I am a new, authenticated moderator

  And the following challenges exist:
  | title                    | description   | start_time   | user_id |
  | Flight path1             | Optimize cost | 25-Nov-1992  |    1    |
  | Flight path2             | Optimize cost | 25-Nov-1992  |    2    |   
  | Flight path3             | Optimize cost | 25-Nov-1992  |    2    |
  | Flight path4             | Optimize cost | 25-Nov-1992  |    1    |
  | Flight path5             | Optimize cost | 25-Nov-1992  |    5    |

Scenario: View all past challenges regardless of challenge organizer
    Given I am on the Chalearn's Challenges page

    Then I should see "Flight path1"
    And I should see "Flight path2"
    And I should see "Flight path3"
    And I should see "Flight path4"
    And I should see "Flight path5"