class ChallengesController < ApplicationController
	include ChallengesHelper
	require 'zip'

	#Cancan filter
	load_and_authorize_resource
	
	def index
		if current_user.admin? || current_user.moderator?
			if params[:sort] == 'title'
				@challenges = Challenge.find(:all,:order => 'LOWER(title)')
			elsif params[:sort] == 'start_time'
				@challenges = Challenge.find(:all,:order => 'start_time')
			elsif params[:sort] == 'end_time'
				@challenges = Challenge.find(:all,:order => 'end_time')
			#elsif params[:sort] == 'created_at'
			#	@challenges = Challenge.find(:all,:order => 'created_at')
			#elsif params[:sort] == 'updated_at'
			#	@challenges = Challenge.find(:all,:order => 'updated_at')
			else
				@challenges = Challenge.all
			end
		else
			if params[:sort] == 'title'
				@challenges = Challenge.all(:conditions => {:user_id => current_user.id},:order => 'LOWER(title)')
			elsif params[:sort] == 'start_time'
				@challenges = Challenge.all(:conditions => {:user_id => current_user.id},:order => 'start_time')
			elsif params[:sort] == 'end_time'
				@challenges = Challenge.all(:conditions => {:user_id => current_user.id},:order => 'end_time')
			#elsif params[:sort] == 'created_at'
			#	@challenges = Challenge.all(:conditions => {:user_id => current_user.id},:order => 'created_at')
			#elsif params[:sort] == 'updated_at'
			#	@challenges = Challenge.all(:conditions => {:user_id => current_user.id},:order => 'updated_at')
			else
				@challenges = current_user.challenges
			end		
		end
	end

    def getstream
        #Challenge
        challenge = Challenge.find_by_id(params[:id])

        #Temp path
        tmp_path = "#{Rails.root}/zip_tmp/"

        #Create zip file
        zip_path = challenge.createZip(tmp_path)

    	#Sending zip
	    zip_file = File.read(zip_path)
	    send_data zip_file, :filename => challenge.title + '.zip', :x_sendfile => true
        
        #Data clean up
        challenge.tempCleanUp(tmp_path)
    end


	def new
		@challenge = Challenge.new
		12.times {@challenge.webpages.build}
		3.times do
			phrase = @challenge.phrases.build
			3.times {phrase.tasks.build}	
		end
	end

	def edit
		@challenge = Challenge.find(params[:id])
	end

	def show
		@challenge = Challenge.find(params[:id])
	end

	def create
		params[:challenge][:start_time] = ChallengesHelper.convert_date params[:challenge][:start_time]
		params[:challenge][:end_time] = ChallengesHelper.convert_date params[:challenge][:end_time]

		@challenge = Challenge.new(params[:challenge])
		if @challenge.save
			flash[:notice] = "Successfully created '#{@challenge.title}' challenge"
			redirect_to @challenge
		else 
			render :action => 'new'
		end
	end

	def update
		params[:challenge][:start_time] = convert_date params[:challenge][:start_time]
		params[:challenge][:end_time] = convert_date params[:challenge][:end_time]

		@challenge = Challenge.find(params[:id])
		if @challenge.update_attributes(params[:challenge])
			flash[:notice] = "Successfully updated '#{@challenge.title}' challenge"
			redirect_to @challenge
		else
			render :action => 'edit'
		end
	end

	def destroy
		@challenge = Challenge.find(params[:id])
		@challenge.destroy 
		flash[:notice] = "Challenge '#{@challenge.title}' deleted."
		redirect_to challenges_path
	end
end
