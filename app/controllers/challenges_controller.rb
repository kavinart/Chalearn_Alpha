class ChallengesController < ApplicationController
	include ChallengesHelper
	require 'zip'
	
	#Cancan filter
	#load_and_authorize_resource

	def self.convert_date(x)
		return x.gsub!('/',',')
	end
	
	#Admin access only
	def index
		@challenges = Challenge.all
	end

	#Normal user use myindex
	def mychallenges
		puts "------------------"
		# puts session[:users]
		puts current_user
		#puts current_user.id
		puts "@@@@@@@@@@@@@@@@@@"

		@challenges = Challenge.all(:limit => 10, :conditions => {:user_id => current_user.id})
	end

    def getstream
    	#Challenge
    	challenge = Challenge.find_by_id(params[:id])

    	#Path parameters
    	file_path = "#{Rails.root}/tmp/zip_tmp"
		zip_name = challenge.id.to_s + 'tmp.zip'

		#Creating html and zip files
		Zip::File.open(file_path + zip_name,Zip::File::CREATE) do |zipfile|
	        challenge.webpages.each do |webpage|
	            html_name = webpage.title_html
	            File.open(file_path + html_name, "w+") do |file|
	                    file.write(webpage.web_content)
	            end

	            zipfile.add(html_name,file_path + html_name)
        	end
        end
        zip_file = File.read(file_path + zip_name)
        send_data zip_file, :filename => challenge.title + '.zip', :x_sendfile => true
    	
    	#Data cleanup
      	challenge.webpages.each do |webpage|
      		html_name = webpage.title_html
      		File.delete(file_path + html_name)
      	end
      	File.delete(file_path + zip_name)
	end

	#All users view public challenges
	#def publicchallenges
	#	@challenges = Challenge.all(:limit => 30, :conditions => {:public => 1})
	#end
	
	def new
		@challenge = Challenge.new
		3.times {@challenge.webpages.build}
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
		if current_user.admin?
			redirect_to challenges_path
		else
			redirect_to my_challenges_path
		end
	end
end