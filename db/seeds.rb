# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create an admin account for testing
user = User.create(:email => 'admin@gmail.com', :password => '12345678', :password_confirmation => '12345678', :role => 'admin', :approved => 1)
user.skip_confirmation!
user.save!

user = User.create(:email => 'mod@gmail.com', :password => '12345678', :password_confirmation => '12345678', :role => 'moderator', :approved => 1)
user.skip_confirmation!
user.save!

user = User.create(:email => 'user@gmail.com', :password => '12345678', :password_confirmation => '12345678', :role => 'organizer', :approved => 1)
user.skip_confirmation!
user.save!