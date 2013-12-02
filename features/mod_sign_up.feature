Feature: moderator sign up

	As a registrant
	So that I will be granted moderator privileges and functions by the webmaster
	I would like an ability to register an moderator account which is confirmed by the webmaster, then log in with my newly created and approved account.

Background: unregistered user goes to the website

	Given that I am an unauthenticated user

	And the following users exist:
    | email                   | password       | password_confirmation | first_name |    role     |

    And I follow "Mod Register"

 Scenario: registering as a moderator
 	Then I should be on the sign up page
 	When I fill in "Email" with "moderator@gmail.com"
 	And I fill in "Password" with "12345678"
 	And I fill in "Password Confirmation" with "12345678"
 	And I fill in "First Name" with "Mod"
 	And I fill in "Last Name" with "Erator"
 	And I press "Sign up"
 	Then the following users exist:
 	| email               | password | password_confirmation | first_name | last_name   | role |
 	| moderator@gmail.com | 12345678 | 12345678              | Mod        | Erator      | mod  |