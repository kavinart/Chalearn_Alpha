class UsersController < ApplicationController

	#Cancan filter
	#load_and_authorize_resource

  def index
    @users = User.all
  end

	def show
		@user = User.find(params[:id])
	end

  def destroy
    @user = User.find(params[:id])
    @user.destroy 
    flash[:notice] = "User '#{@user.email}' deleted."
    redirect_to users_path
  end

  
end