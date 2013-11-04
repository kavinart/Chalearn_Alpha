class UsersController < ApplicationController

	#Cancan filter
	load_and_authorize_resource

	def index
		@users = Users.all
	end

	def show
		@user = Challenge.find(params[:id])
	end

end