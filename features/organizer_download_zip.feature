Feature: make package downloadable for users
 
  As an organizer 
  So that I can compile and organize challeges based on the informations given by the packages
  I want to be able to download the package zip file.
  
Background: challenges have been added to database
  
  Given I am a new, authenticated user

  And the following challenges exist:
  | title                   | description   | start_time   | user_id |
  | Flight path             | Optimize cost | 25-Nov-1992  |    1    |

  And I am on the Chalearn's Challenges page

Scenario: Create a challenge
  Then show me the page
  Given I am on the Chalearn's Challenges page
  When I follow "zip_1"
  Then I should receive a file "HIV Challenge.zip"