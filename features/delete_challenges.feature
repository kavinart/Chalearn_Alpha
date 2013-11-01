Feature: delete an existing challenge
 
  As a registered organizer
  So that I can delete existing challenge permanently from my database
  I want to be able to click the delete button and confirm my deletion before destroying the challenge from the database

Background: challenges and organizers have been added to the database
  
  Given I am a new, authenticated user

  And the following challenges exist:
  | title                   | description   | start_time   | user_id |
  | Flight path             | Optimize cost | 25-Nov-1992  |    1    |
  | Brain decoding          | Decode        | 30-Dec-2013  |    2    |

  And I am on the Chalearn's Challenges page

Scenario: Tries to delete a challenge and confirm deletion
  Given I am on the Chalearn's Challenges page
  Then I should see "Flight path"
  When I follow "delete_1"
  And I confirm popup with "OK"
  Then I should be on the Chalearn's Challenges page
  And the following challenges should be in the database:
  | title                   | description   | start_time   | user_id |
  | Brain decoding          | Decode        | 30-Dec-2013  |    2    |
  And the following challenges should not be in the database:
  | title                   | description   | start_time   | user_id |
  | Flight path             | Optimize cost | 25-Nov-1992  |    1    |

Scenario: Tries to delete a challenge but cancel
  Given I am on the Chalearn's Challenges page
  Then I should see "Flight path"
  When I follow "delete_1"
  And I confirm popup with "Cancel"
  Then I should be on the Chalearn's Challenges page
  And the following challenges should be in the database:
  | title                   | description   | start_time   | user_id |
  | Flight path             | Optimize cost | 25-Nov-1992  |    1    |
  | Brain decoding          | Decode        | 30-Dec-2013  |    2    |
