Feature: display list of challenges sorted by different criteria
 
  As an organizer, 
  So that I can quickly browse challenges based on my preference,
  I want to see challenges sorted by start date, end date, create date, title
  
Background: movies have been added to database
  
  Given the following movies exist:
  | title                       | start_date           | end_date               | create_date     |
  | HIV Challenge               | 03/November/2013     | 03/November/2014       | 03/October/2013 |
  | Computer Vision Challenge   | 03/November/2012     | 03/October/2014        | 02/October/2013 |

  And I am on the challenges page

Scenario: sort challenges by start date
  When I follow "Start Date"
  Then I should see "Computer Vision Challenge" before "HIV Challenge"

Scenario: sort challenges by end date
  When I follow "End Date" 
  Then I should see "Computer Vision Challenge" before "HIV Challenge"

Scenario: sort challenges by create date
  When I follow "Create Date"
  Then I should see "Computer Vision Challenge" before "HIV Challenge"

Scenario: sort challenges by title
  When I follow "Challenge Title"
  Then I should see "Computer Vision Challenge" before "HIV Challenge"
