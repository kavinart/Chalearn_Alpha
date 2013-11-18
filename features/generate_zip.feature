Feature: generate zip files of html and yaml

  As a challenge organizer
  So that I can render my challenge site elsewhere
  I want a way to generate a zip file that contains all the necessary information for me to do so

Background: challenges and organizers have been added to the database
  
  Given I am a new, authenticated user

  And the following challenges exist:
  | title                   | description   | start_time   | user_id |
  | Flight path             | Optimize cost | 25-Nov-1992  |    1    |

  And I am on the mychallenges page

Scenario: generate zip file

  When I follow "zip" on "Flight path"
  Then I should download a file called "flight_path.zip"
  When I unzip "flight_path.zip"
  Then I should see a file called "index.html"

