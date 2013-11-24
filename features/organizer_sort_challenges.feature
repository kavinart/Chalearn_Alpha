Feature: display list of challenges sorted by different criteria
 
  As an organizer 
  So that I can quickly browse challenges based on my preference
  I want to see challenges sorted by start date, end date, create date, title
  
Background: challenges have been added to database
  
  Given I am a new, authenticated user

  And the following challenges exist:
  | title                       | start_time           | end_time               |  user_id |
  | HIV Challenge               | 03-November-2013     | 03-November-2014       |     1    |
  | Computer Vision Challenge   | 03-November-2012     | 03-October-2014        |     1    |

  And I am on the Chalearn's Challenges page

Scenario: sort challenges by start time
  When I follow "Start Time"
  Then I should see "Computer Vision Challenge" before "HIV Challenge"

Scenario: sort challenges by end time
  When I follow "End Time" 
  Then I should see "Computer Vision Challenge" before "HIV Challenge"

Scenario: sort challenges by title
  When I follow "Title"
  Then I should see "Computer Vision Challenge" before "HIV Challenge"