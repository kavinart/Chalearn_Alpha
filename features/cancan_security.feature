Feature: cancan security check

  As a challenge organizer
  So that I can make sure that my information is secure
  I want to make sure no one but me and the admin are able to access my challenges

Background: challenges and organizers have been added to the database

  Given the following challenges exist:
  | title                   | description   | start_time   | user_id |
  | Flight path             | Optimize cost | 25-Nov-1992  |    1    |

Scenario: direct access via URL

  Given I am an unauthenticated user
  And I go to my challenges page
  Then I should be denied access

