class ApplicationController < ActionController::Base
  protect_from_forgery
	def after_sign_in_path_for(resource)
		challenges_path
	end

	rescue_from CanCan::AccessDenied do |exception|
  		flash[:error] = "Error! You are unauthorized to access this page (cancan)"
  		redirect_to root_url
	end
end
