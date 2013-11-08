class UsersController < ApplicationController

	#Cancan filter
	load_and_authorize_resource

  def index
    #if params[:approved] == "false"
    #  @users = User.find_all_by_approved(false)
    #else
      @users = User.all
    #end
  end

	def show
		@user = User.find(params[:id])
	end

  def destroy
    @user = User.find(params[:id])
    @user.destroy 
    flash[:notice] = "Challenge '#{@challenge.title}' deleted."
    redirect_to users_path
  end

  
end