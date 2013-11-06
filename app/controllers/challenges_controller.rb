class ChallengesController < ApplicationController
	include ChallengesHelper
	require 'zip'
	
	#Cancan filter
	load_and_authorize_resource

	def self.convert_date(x)
		return x.gsub!('/',',')
	end
	
	#Admin access only
	def index
		@challenges = Challenge.all
	end

	#Normal user use myindex
	def mychallenges
		@challenges = Challenge.all(:limit => 10, :conditions => {:user_id => current_user.id})
	end

	def getstream
		# file_path = "#{Rails.root}/app/assets/images/logo.png"
		# file_name = "logo.png"
		#begin
		challenge = Challenge.find_by_id(2)

		Zip::File.open("#{Rails.root}/tmp/zipfile_name.zip",Zip::File::CREATE) do |zipfile|
			challenge.webpages.each do |webpage|
				html_name = webpage.title_html
				file_path = "#{Rails.root}/tmp/"
				
				puts '----------------------------------------'
				puts html_name
				puts file_path
				File.open(file_path + html_name, "w+") do |file|
					file.write(webpage.web_content)
				end
				zipfile.add(html_name,file_path)
			end
		end

        # @test = Zip::File.open("#{Rails.root}/tmp/zipfile_name.zip", Zip::File::CREATE) do |zipfile|

       	# 	zipfile.add(file_name, file_path)
       	# end
       	 
       	send_file "#{Rails.root}/tmp/zipfile_name.zip", :type => 'application/zip', :filename => "TESTZIP.zip", :x_sendfile => true
  		# File.delete("#{Rails.root}/tmp/zipfile_name.zip")

       #rescue         
       #end
     end




	#All users view public challenges
	#def publicchallenges
	#	@challenges = Challenge.all(:limit => 30, :conditions => {:public => 1})
	#end
	
	def new
		@challenge = Challenge.new
		1.times {@challenge.webpages.build}
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
