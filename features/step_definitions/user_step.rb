Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  user = User.create(:email => email, :password => password, :password_confirmation => password,:role => 'user')
  user.skip_confirmation!
  user.save!
  visit '/users/sign_in'

  fill_in "drop_user_email", :with => email
  fill_in "drop_user_password", :with => password
  click_button "drop_sign_in"

end

Given /^I am a new, authenticated moderator$/ do
  email = 'ryo.miyaichi@arsenal.co.uk'
  password = '12345678'
  first = 'Ryo'
  last = 'Miyaichi'
  organization = 'Arsenal'
  work_id = 0
  role = "moderator"
  user = User.create(:email => email, :password => password, :password_confirmation => password, 
    :first_name => first, :last_name => last, :organization => organization, :work_id => work_id, :role => role)
  user.skip_confirmation!
  user.save!
  visit '/users/sign_in'

  fill_in "drop_user_email", :with => email
  fill_in "drop_user_password", :with => password
  click_button "drop_sign_in"
end

Given /^I am a new, authenticated user with full profile$/ do
  email = 'ryo.miyaichi@arsenal.co.uk'
  password = '12345678'
  first = 'Ryo'
  last = 'Miyaichi'
  organization = 'Arsenal'
  work_id = 0
  role = "organizer"
  user = User.create(:email => email, :password => password, :password_confirmation => password, 
    :first_name => first, :last_name => last, :organization => organization, :work_id => work_id, :role => role)
  user.skip_confirmation!
  user.save!
  visit '/users/sign_in'

  fill_in "drop_user_email", :with => email
  fill_in "drop_user_password", :with => password
  click_button "drop_sign_in"

end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
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
