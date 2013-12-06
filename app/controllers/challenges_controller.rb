class ChallengesController < ApplicationController
	include ChallengesHelper
	require 'zip'

	#Cancan filter
	load_and_authorize_resource


	def self.convert_date(x)
		return x.gsub!('/',',')
	end
	
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

        #Path parameters
        file_path = "#{Rails.root}/zip_tmp/"
        zip_name = 'tmp'+ challenge.id.to_s + '.zip'
        yml_name = 'tmp' + challenge.id.to_s + '.yml'

        #Creating yaml hash
        yaml_hash = Hash.new()
        challenge.attributes.each do |attr_name, attr_value|
        	yaml_hash[attr_name] = attr_value
        end

        #Prepare webpage for
        yaml_html = Hash.new()
        challenge.webpages.each do |webpage|
        	if webpage.title != ''
	        	if webpage.is_external_url == false
	        		yaml_html[webpage.title] = webpage.html_title
	        	else
	        		yaml_html[webpage.title] = webpage.url
	        	end
	        end
        end
        yaml_hash["html"] = yaml_html

        #Prepare phase hash for yaml file
        yaml_phase = Hash.new()
        challenge.phrases.each_with_index do |phrase, index|
        	if phrase.label != ''
	        	yaml_phase_attr = Hash.new()
	        	phrase.attributes.each do |attr_name, attr_value|
	        		yaml_phase_attr[attr_name] = attr_value
	        	end
	        	yaml_task = Hash.new()
	        	phrase.tasks.each_with_index do |task, task_index|
	        		if task.name != ''
		        		yaml_task_attr = Hash.new()
		        		task.attributes.each do |attr_name, attr_value|
		        			yaml_task_attr[attr_name] = attr_value
		        		end
		        		yaml_task[task_index+1] = yaml_task_attr
		        	end
	        	end
	        	yaml_phase_attr["tasks"] = yaml_task
	        	yaml_phase[index+1] = yaml_phase_attr
	        end
        end
        yaml_hash["phase"] = yaml_phase


        #Create yaml file
        File.open(file_path + yml_name, "w+") do |file|
        	file.write(yaml_hash.to_yaml)
        end

        #Creating html and zip files
        Zip::File.open(file_path + zip_name,Zip::File::CREATE) do |zipfile|
	        challenge.webpages.each do |webpage|
	        	if webpage.title != ""
		            html_name = webpage.title + '.html'
		            File.open(file_path + html_name, "w+") do |file|
		                    file.write(webpage.web_content)
		            end

		            #Add each html to zip
		            zipfile.add(html_name,file_path + html_name)
	        	end
	        end
	        #Add yml to the zip
	        zipfile.add(yml_name,file_path + yml_name)
    	end

    	#Sending zip
	    zip_file = File.read(file_path + zip_name)
	    send_data zip_file, :filename => challenge.title + '.zip', :x_sendfile => true
        
        #Data cleanup
        challenge.webpages.each do |webpage|
        	if webpage.title != ""
		    	html_name = webpage.title + '.html'
		    	File.delete(file_path + html_name)
		    end
	      end
		File.delete(file_path + zip_name)
		File.delete(file_path + yml_name)
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
