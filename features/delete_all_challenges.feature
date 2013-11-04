Feature: Delete all challenges 
 
  As a registered admin
  So that I can view all challenges in the system
  I want to be view the challenges in the database with the all the information about users' challenges 

Background: registered users have been added to the database
  Given I am an authenticated admin

  And the following challenges exist:
  | title                   | description   | start_time   | owned by |
  | Flight path             | Optimize cost | 25-Nov-1992  | user1    |
  | Brain decoding          | Decode        | 30-Dec-2013  | user2    |
  | Cure                    | Decode        | 26-Dec-2013  | user3    |

Scenario: Delete all the challenges in the database
  Given I am on the Chalearn's Admin challenges page
  Then I should see "Flight path"
  When I follow "delete_1"
  And I confirm popup with "OK"
  Then I should be on the Chalearn's Challenges page

  And I should see "Brain decoding"
  And I should see "Cure"
  And I should not see "Flight path"