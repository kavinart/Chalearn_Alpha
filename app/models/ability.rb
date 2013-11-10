class Ability
	include CanCan::Ability
	def initialize(user)

		if user != nil
			puts user.id
			puts user.role
		else
			puts "USER NIL"
		end
		#Unregistered user(nil) can only create new user
		if user == nil
			can :create, User

		#Admin has all powers on all models
		elsif user.admin?
			can :manage, :all

		#Moderator has all powers on all models, except admin/mod accounts.
		elsif user.moderator?
			can :manage, :all

			#Cannot edit admin/mod account
			cannot :update, User do |user|
				user.try(role) == 'admin' ||
				user.try(role) == 'moderator'
			end

			#Cannot delete admin/mod account
			cannot :destroy, User do |user|
				user.try(role) == 'admin' ||
				user.try(role) == 'moderator'
			end

			#Cannot create admin/mod account
			cannot :create, User do |user|
				user.try(role) == 'admin' ||
				user.try(role) == 'moderator'
			end


		#Normal registered orgnizer
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
			#but cannot get see others' challenges 
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

			#Create a new challenge
			can :create, Challenge

			#Access my challenge page
			can :mychallenges, Challenge

			#Create zip of his own challenge
			can :getstream, Challenge do |challenge|
				challenge.try(:user_id) == user.id
			end
		end
	end
end