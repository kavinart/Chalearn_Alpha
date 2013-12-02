Feature: organizer create zip files

	As an organizer
	I would like to have a zip file that contains not only a single yaml file but also html contents in separate html files
	So that when I create/edit a new challenge, a new zip file is created with a yaml file and its corresponding html files in it.
	I want a system that allow users to download the zip file immediately once the challenge is created/edited 

Background: challenges have been added to the database
  
	Given I am a new, authenticated user

	And the following challenges exist:
	| title                    | description           | start_time   | user_id |
	| Flight path              | Optimize cost         | 25-Nov-1992  |    1    |
	| Disney queues            | Optimize waiting time | 25-Dec-1993  |    2    |
	| Zebrafish brain activity | Map brain activity    | 25-Feb-1994  |    3    |

	And I am on the Chalearn's Challenges page

Scenario: click zip to download HTML and YAML files for only user id == 1
	Given that I am on the Chalearn's Challenges page
	Then I should see "zip_1"
	And I should not see "zip_2"
	And I should not see "zip_3"
	When I follow "zip_1"
	Then I should receive a zip file "Flight path.zip"