# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(:email => 'admin@gmail.com', :password => '12345678', :password_confirmation => '12345678', :role => 'admin')
user.skip_confirmation!
user.save

user = User.new(:email => 'mod@gmail.com', :password => '12345678', :password_confirmation => '12345678', :role => 'moderator')
user.skip_confirmation!
user.save

user = User.new(:email => 'user1@gmail.com', :password => '12345678', :password_confirmation => '12345678', :role => 'organizer')
user.skip_confirmation!
user.save

user = User.new(:email => 'user2@gmail.com', :password => '12345678', :password_confirmation => '12345678', :role => 'organizer')
user.skip_confirmation!
user.save


user = User.new(:email => 'user3@gmail.com', :password => '12345678', :password_confirmation => '12345678', :role => 'organizer')
user.skip_confirmation!
user.save