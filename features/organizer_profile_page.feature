Feature: organizer profile page

  As an organizer
  So that I can promote my organization and my challenges
  I want a profile page that other users can see my information

Background: organizer has been added to the database
  
  Given I am a new, authenticated user

  And the following challenges exist:
  | title                   | description   | start_time   | user_id |
  | Flight path             | Optimize cost | 25-Nov-1992  |    1    |

  And I am on my profile page

Scenario: default profile page

  Then I should see "default_profile_picture.jpg"
  And I should see "default_profile_name"
  And I should see "default_profile_description"
  When I follow "My Challenges"
  Then I should see "Flight path"

Scenario: edit profile photo

  When I follow "Edit"
  And I upload "new_profile_photo.jpg"
  And I press "Save"
  Then I should see "new_profile_photo.jpg"

Scenario: edit profile name

  When I follow "Edit"
  And I fill in "Profile Name" with "new_profile_name"
  And I press "Save"
  Then I should see "new_profile_name"

Scenario: edit profile description

  When I follow "Edit"
  And I fill in "Description" with "new_profile_description"
  And I press "Save"
  Then I should see "new_profile_description"