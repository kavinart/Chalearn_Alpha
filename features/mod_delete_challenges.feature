Feature: Moderater delete challenges 
 
  As an approved moderator
  So that I can delete unwanted challenges,
  I want a system that gives me an ability to delete an unwanted challenge.

Background: challenges have been added to the database

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