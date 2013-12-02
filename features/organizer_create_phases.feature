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

    When I press "Add Phase"
    Then I should see "challenge_phases_attributes_0_label"
    And I should see "challenge_phases_attributes_0_start_date"
    And I should see "challenge_phases_attributes_0_end_date"
    And I should see "challenge_phases_attributes_0_max_submissions"
    And I should see "challenge_phases_attributes_0_submissions_per_day"
    And I should see "challenge_phases_attributes_0_task_averaging"
    And I should see "challenge_phases_attributes_0_numeric_format"

    When I press "Add Phase"
    Then I should see "challenge_phases_attributes_1_label"
    And I should see "challenge_phases_attributes_1_start_date"
    And I should see "challenge_phases_attributes_1_end_date"
    And I should see "challenge_phases_attributes_1_max_submissions"
    And I should see "challenge_phases_attributes_1_submissions_per_day"
    And I should see "challenge_phases_attributes_1_task_averaging"
    And I should see "challenge_phases_attributes_1_numeric_format"

    When I press "Add Phase"
    Then I should see "challenge_phases_attributes_2_label"
    And I should see "challenge_phases_attributes_2_start_date"
    And I should see "challenge_phases_attributes_2_end_date"
    And I should see "challenge_phases_attributes_2_max_submissions"
    And I should see "challenge_phases_attributes_2_submissions_per_day"
    And I should see "challenge_phases_attributes_2_task_averaging"
    And I should see "challenge_phases_attributes_2_numeric_format"


    

