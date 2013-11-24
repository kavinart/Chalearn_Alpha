Feature: Moderater delete challenges 
 
  As a registered moderator
  So that I can view all challenges in the system
  I want to be view the challenges in the database with the all the information about users' challenges 

Background: registered users have been added to the database

Given I am a new, authenticated moderator

  And the following challenges exist:
  | title                   | description   | start_time   | user_id |
  | Flight path             | Optimize cost | 25-Nov-1992  |    52   |
  | Brain decoding          | Decode        | 30-Dec-2013  |    99   |
  | Cure                    | Decode        | 26-Dec-2013  |    12   |

Scenario: Delete all the challenges in the database
  Given I am on the Chalearn's Challenges page
  Then I should see "Flight path"
  When I follow "delete_1"
  And I confirm popup with "OK"
  Then I should be on the Chalearn's Challenges page

  And I should see "Brain decoding"
  And I should see "Cure"
  And I should not see "Optimize cost"