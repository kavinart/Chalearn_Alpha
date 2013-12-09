class UsersController < ApplicationController

	#Cancan filter
	load_and_authorize_resource

  def index
    @users = User.all
  end

	# def show
	# 	@user = User.find(params[:id])
	# end

  def changeRole
    @user = User.find(params[:id])
    @user.role = params[:role]

    if ['organizer', 'moderator'].include? params[:role] and @user.save
      flash[:notice] = "User '#{@user.email}' has been made #{params[:role]}"
    else
      flash[:error] = "Can't change role"  
    end

    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy 
    flash[:notice] = "User '#{@user.email}' deleted."
    redirect_to users_path
  end

  
end