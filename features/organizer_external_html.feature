Feature: add external html ability

	As an organizer, I would like to create a new challenge by only providing an external link that overrides the typical implementation of a challenge
	So that when I create a challenge, I can have the ability to implement my challenge on an external site without completing all the information about the challenge again on the form
	I want to have the ability to input an external site instead of typing pure html into a text box

Background: challenges have been added to the database
  
	Given I am a new, authenticated user

Scenario: Create a challenge
    Given I am on the Chalearn's Challenges page
    When I follow "New Challenge"
    Then I should be on the New Challenge page

    When I fill in "Title" with "Finance machine learning"
    And I fill in "Description" with "Model the financial crisis"
    And I check "challenge_webpages_attributes_0_is_external_url"
    When I fill in "challenge_webpages_attributes_0_url" with "http://www.test.com"
    And I press "submit"

    Then I should be on the details page for "Finance machine learning"
    And I should see "Finance machine learning"
    And I should see "http://www.test.com"