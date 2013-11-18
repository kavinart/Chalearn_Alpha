Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

# Given /^I am a new, authenticated user$/ do
#   email = 'testing@man.net'
#   password = 'secretpass'
#   user = User.create(:email => email, :password => password, :password_confirmation => password, :role => 'organizer')
#   user.skip_confirmation!
#   user.save!
#   visit '/d/users/sign_in'

#   fill_in "user_email", :with => email
#   fill_in "user_password", :with => password
#   click_button "user_commit"
# end

Given /^I am a new, authenticated user$/ do
  email = 'admin@test.com'
  password = '12345678'
  role = 'admin'
  user = FactoryGirl.create(:user, :email => email, :password => password, :password_confirmation => password, :role => role)
  user.skip_confirmation!
  user.save!
  visit '/d/users/sign_in'

  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "user_commit"
end

Given /^I am a new, authenticated admin$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  user = User.create(:email => email, :password => password, :password_confirmation => password, :role => 'admin')
  user.skip_confirmation!
  user.save!
  @user = user
  
  visit '/d/users/sign_in'

  fill_in "drop_user_email", :with => email
  fill_in "drop_user_password", :with => password
  click_button "drop_sign_in"
end

When /kuy/ do
  puts "--"
  puts @user
  puts "@@"
end


# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.

  # Assert that the string of the page has e1 then anything(including newlines becaz /m) then e2 
  assert page.body =~ /#{e1}.*#{e2}/m, "{e1} is not before #{e2}"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  
  #For each rating
  rating_list.split(',').each do |rating|
    #Boolean uncheck
    if uncheck
      #Apply uncheck
      uncheck "ratings_#{rating}"
    else
      #Apply check
      check "ratings_#{rating}"
    end
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table

  #Iterate over all the movies
  Movie.all.each do |movie|
    #Check if there exists such movie the in page.body string
    assert page.body =~ /#{movie.title}/m, "#{movie.title} is missing"
  end
end
