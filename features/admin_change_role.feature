Feature: moderator sign up

	As an admin
	So that I will be able to grant moderator privileges and functions to a regular user
	I would like an ability to change the account status of a user to become a moderator

Background: Admin goes to the user table 

	Given I am a new, authenticated admin

	And the following users exist:
    | email                   | password       | password_confirmation | first_name |    role     |
    | benz_s@gmail.com          | 12345678       | 12345678              | Benz       | organizer   |

    And I follow "Manage Users"

 Scenario: Change a user into a moderator
 	Given I am on the users page
 	When I follow "make_mod_2"
 
 	Then I should see "benz_s@gmail.com"
    And I should see "moderator"
    And I should not see "organizer"

Scenario: Change himself into a moderator
 	Given I am on the users page
 	When I follow "make_mod_1"

 	Then I should see "Error"
