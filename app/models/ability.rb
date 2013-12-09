class Ability
	include CanCan::Ability

	def restrict_nil(user)
		can :create, User
	end

	def restrict_admin(user)
		can :manage, :all

		cannot :changeRole, User do |user| 
			user.try(:role) == 'admin'
		end
	end

	def restrict_mod(user)
		can :manage, :all

		#Cannot edit admin/mod account
		cannot :update, User do |user|
			user.try(:role) == 'admin' ||
			user.try(:role) == 'moderator'
		end

		#Cannot delete admin/mod account
		cannot :destroy, User do |user|
			user.try(:role) == 'admin' ||
			user.try(:role) == 'moderator'
		end

		#Cannot create admin/mod account
		cannot :create, User do |user|
			user.try(:role) == 'admin' ||
			user.try(:role) == 'moderator'
		end

		cannot :changeRole, User
	end

	def restrict_user(user)
		#Index
		can :index, Challenge

		#Edit
		can :update, Challenge do |challenge|
			challenge.try(:user_id) == user.id
		end

		#Update
		can :update, User do |user_in|
			user_in.try(:user_id) == user.id
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
			user_in.try(:user_id) == user.id
		end

		#Create a new challenge
		can :create, Challenge

		#Create zip of his own challenge
		can :getstream, Challenge do |challenge|
			challenge.try(:user_id) == user.id
		end

	end

	def initialize(user)
		#Unregistered user(nil) can only create new user
		if user == nil
			self.restrict_nil(user)

		#Admin has all powers on all models
		elsif user.admin?
			self.restrict_admin(user)

		#Moderator has all powers on all models, except admin/mod accounts.
		elsif user.moderator?
			self.restrict_mod(user)

		#Normal registered orgnizer
		else
			self.restrict_user(user)
		end
	end
end