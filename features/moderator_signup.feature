Feature: moderator sign up, and log in
 
As a registrant, 
I would like an ability to register a moderator account which is confirmed by the webmaster, and then log in with my newly created and approved account.
So that I will be granted moderator privileges and functions by the webmaster.

Background: registered moderators have been added to the database
    
  Given I am a registrant
  And the following admins exist:
  | email                   | Password      | First name    | Last name    | mod_id |
  | admin1@gmail.com        | 12345678      | John          |    Doe       |    1   |
  | admin2@gmail.com        | 23456789      | Jane          |    Doe       |    2   |
  
  And I am not a authenticated user
  And I am on the Chalearn's Challenges page

Scenario: Request an admin account
    Given I am on the Chalearn's Challenges page
    When I follow "Moderator account request"
    Then I should be on the Moderator signup page

    When I fill in "First name" with "Benz"
    And I fill in "Last name" with "Stwart"
    And I fill in "Email" with "modbenz@gmail.com"
    And I fill in "Password" with "mod123456"
    And I fill in "Reason" with "Webmaster assigned me"
    And I press "submit"

    Then I should be on the Chalearn's Challenges page
    And I should see "Request sent. Awaiting confirmation from webmaster"