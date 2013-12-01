Feature: moderator create zip files

	As a moderator
	I would like to have a zip file that contains not only a single yaml file but also html contents in separate html files
	So that when I create/edit a new challenge, a new zip file is created with a yaml file and its corresponding html files in it.
	I want a system that allow users to download the zip file immediately once the challenge is created/edited 

Background: challenges have been added to the database
  
	Given I am a new, authenticated moderator

	And the following challenges exist:
	| title                    | description           | start_time   | user_id |
	| Flight path              | Optimize cost         | 25-Nov-1992  |    1    |
	| Disney queues            | Optimize waiting time | 25-Dec-1993  |    2    |
	| Zebrafish brain activity | Map brain activity    | 25-Feb-1994  |    3    |

	And I am on the Chalearn's Challenges page

Scenario: click zip to download HTML and YAML files regardless of user id
	When I follow "zip_1"
	Then I should receive a zip file "Flight path.zip"
	When I follow "zip_2"
	Then I should receive a zip file "Disney queues.zip"
	When I follow "zip_3"
	Then I should receive a zip file "Zebrafish brain activity.zip"
