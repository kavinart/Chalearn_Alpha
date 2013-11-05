class Ability
	include CanCan::Ability
	def initialize(user)

		#Unregistered user(nil) can only create new user
		if user == nil
			can :create, User
		#Admin has all powers on all models
		elsif user.admin?
			can :manage, :all
		#Normal registered user
		else
			#View public challenges
			#can :publicchallenges, Challenge

			#Edit
			can :update, Challenge do |challenge|
				challenge.try(:user_id) == user.id
			end
			can :update, User do |user_in|
				user_in.try(id) == user.id
			end

			#User can only see their own challenges, 
			#but cannot get see challenges 
			can :show, Challenge do |challenge|
				challenge.try(:user_id) == user.id
			end

			#Destroy
			can :destroy, Challenge do |challenge|
				challenge.try(:user_id) == user.id
			end
			can :destroy, User do |user_in|
				user_in.try(id) == user.id
			end

			#Create
			can :create, Challenge

			#Access my challenge page
			can :mychallenges, Challenge
		end
	end
end