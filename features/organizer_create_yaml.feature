Feature: organizer create yaml files

	As an organizer, I would like to have a simple data serialization format that contains all specification of a challenge including title, description, htmls, phrases, and tasks
	So that when I create/edit a new challenge, I can have a single data file that contains all information about the challenge. 
	I want all the information of the challenge in a single yaml file

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
	And the zip file "Flight path.zip" should contain "overview.html"
	And the zip file "Flight path.zip" should contain "data.html"
	And the zip file "Flight path.zip" should contain "instructions.html"
	And the zip file "Flight path.zip" should contain "evaluation.html"
	And the zip file "Flight path.zip" should contain "terms_and_conditions.html"
	And the zip file "Flight path.zip" should contain "timeline.html"
	And the zip file "Flight path.zip" should contain "prize.html"
	And the zip file "Flight path.zip" should contain "credits.html"
	And the zip file "Flight path.zip" should contain "tutorial.html"
	And the zip file "Flight path.zip" should contain "faq.html"
	And the zip file "Flight path.zip" should contain "factsheets.html"
	And the zip file "Flight path.zip" should contain "workshop.html"
	And the zip file "Flight path.zip" should contain "Flight path.yaml"
