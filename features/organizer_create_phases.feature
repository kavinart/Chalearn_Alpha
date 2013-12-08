Feature: organizer creates phases within a challenge

	As an organizer, 
	I would like to create phases within a challenge and tasks within each phase 
	So that when I create/edit a new challenge, I can add multiple phases into a single challenge and create multiple tasks within each phase created accordingly
	I want a to create a challenge that allows the me to add multiple phases to the challenge and multiple tasks within each phase 

Background: challenges have been added to the database
  
	Given I am a new, authenticated user

	And the following challenges exist:
	| title                   | description   | start_time   | user_id |
	| Flight path             | Optimize cost | 25-Nov-1992  |    1    |

	And I am on the Chalearn's Challenges page

Scenario: Create a challenge
    Given I am on the Chalearn's Challenges page
    When I follow "New Challenge"
    Then I should be on the New Challenge page
    Then show me the page

    When I fill in "Title" with "Finance machine learning"
    And I fill in "Start time" with "30/October/2013"
    And I fill in "End time" with "31/October/2013"
    And I fill in "Description" with "Model the financial crisis"
    And I fill in "challenge_webpages_attributes_0_title" with "Fed Model"
    And I fill in "challenge_webpages_attributes_0_web_content" with "<b>content of a page</b>"
    And I fill in "challenge_phrases_attributes_0_label" with "BETA"
    And I fill in "challenge_phrases_attributes_0_start_date" with "30/October/2012"
    And I fill in "challenge_phrases_attributes_0_end_date" with "30/October/2013"
    And I fill in "challenge_phrases_attributes_0_max_submissions" with "100" 
    And I fill in "challenge_phrases_attributes_0_submissions_per_day" with "5"
    And I fill in "challenge_phrases_attributes_0_task_averaging" with "yes"
    And I fill in "challenge_phrases_attributes_0_numeric_format" with "6"
    And I fill in "challenge_phrases_attributes_0_tasks_attributes_0_name" with "ALEX"
    And I fill in "challenge_phrases_attributes_0_tasks_attributes_0_url" with "https://chalearn.inf.ethz.ch"
    And I fill in "challenge_phrases_attributes_0_tasks_attributes_0_description" with "Sample"
    And I press "submit"    
    Then I should be on the details page for "Finance machine learning"
    And I should see "Finance machine learning"
