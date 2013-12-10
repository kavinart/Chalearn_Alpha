Feature: All users have the ability to edit their profile
 
  As a registered organizer
  So that I can view and edit my personal informations
  I want to have my own profile page where it shows these informations
  and be able to edit them.

Background: organizers have been added to the database
  
  Given I am a new, authenticated user with full profile
  And I follow "Edit"

Scenario: Edit profile
  Then I should be on the User Profile page
  When I fill in "First name" with "Olivier"
  And I fill in "Last name" with "Giroud"
  And I fill in "Current password" with "12345678"
  And I press "submit"

  Then I should be on the home page
  And I should see "Olivier"
  And I should see "Giroud"
    