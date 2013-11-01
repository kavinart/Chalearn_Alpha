#Append the following entries into the challenge table
Given /the following challenges exist/ do |challenges_table|
	challenges_table.hashes.each do |challenge|
		Challenge.create!(challenge)
	end
end

Then /the following challenges should be in the database/ do |challenges_table|
  challenges_table.hashes.each do |challenge|
    object = Challenge.find_by_title(challenge[:title])
    puts challenge[:title]
    puts "object"
    puts object
    assert object != nil
  end
end

Then /the following challenges should not be in the database/ do |challenges_table|
  challenges_table.hashes.each do |challenge|
    object = Challenge.find_by_title(challenge[:title])
    puts challenge[:title]
    puts "--"
    puts object
    assert object == nil
  end
end



#Assert start_time attribute of a challenge
Then /the start time of "(.*)" should be "(.*)"/ do |title,start_time|
	challenge = Challenge.find_by_title(title)
	assert challenge.start_time == start_time
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
