Feature: Moderator delete users
 
  As an approved moderator
  So that I can delete existing any organizers permanently from my database
  I want to be able to click the delete button and confirm my deletion before destroying the challenge from the database

Background: registered users have been added to the database
  
  Given I am a new, authenticated moderator

  And the following users exist:
  | email                   | password       | password_confirmation | first_name |    role     |
  | test@test.com           | 12345678       | 12345678              |   BenV     |  Organizer  |
  | test1@test.com          | 12345678       | 12345678              |   Sun      |  Organizer  |
  | test2@test.com          | 12345678       | 12345678              |   Lily     |  Organizer  |

  And I am on the home page

Scenario: Tries to delete a challenge and confirm deletion
  Given I am on the users page
  Then I should see "test@test.com"
  And I should see "test1@test.com"
  And I should see "test2@test.com"

  When I follow "delete_2"
  And I confirm popup with "OK"

  Then I should see "test1@test.com"
  And I should see "Sun"
  And I should see "test2@test.com"
  And I should see "Lily"
  And I should see "ryo.miyaichi@arsenal.co.uk"
  And I should see "Ryo"
  And I should not see "BenV"

