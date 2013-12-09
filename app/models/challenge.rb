class Challenge < ActiveRecord::Base
  attr_accessible :description, :end_time, :start_time, :title, :yamlformat, :webpages_attributes, :phrases_attributes, :user_id, :timestamps
  has_many :webpages, :dependent => :destroy
  has_many :phrases, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :webpages, :allow_destroy => true
  accepts_nested_attributes_for :phrases, :allow_destroy => true

  def getyaml_hash
    #Creating yaml hash
    yaml_hash = Hash.new()
    self.attributes.each do |attr_name, attr_value|
    	yaml_hash[attr_name] = attr_value
    end

    #Prepare webpage for
    yaml_html = Hash.new()
    self.webpages.each do |webpage|
    	yaml_html[webpage.title] = webpage.webpage_yaml
    end
    yaml_hash["html"] = yaml_html

    #Prepare phase hash for yaml file
    yaml_phase = Hash.new()
    self.phrases.each_with_index do |phrase, index|
    	yaml_phase[index+1] = phrase.phase_yaml
    end
    yaml_hash["phase"] = yaml_phase

    return yaml_hash
  end

  def createZip(file_path)
    #Path parameters
    zip_name = 'tmp'+ self.id.to_s + '.zip'
    yml_name = 'tmp' + self.id.to_s + '.yml'

    yaml_hash = self.getyaml_hash

    #Create yaml file
    File.open(file_path + yml_name, "w+") do |file|
      file.write(yaml_hash.to_yaml)
    end

    #Creating html and zip files
    Zip::File.open(file_path + zip_name,Zip::File::CREATE) do |zipfile|
      self.webpages.each do |webpage|
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

    return file_path + zip_name
  end

  def tempCleanUp(file_path)
    #Delete html files
    self.webpages.each do |webpage|
      if not webpage.title.empty?
        File.delete(file_path + webpage.title + '.html')
      end
    end

    File.delete(file_path + 'tmp'+ self.id.to_s + '.zip') #Delete zip file
    File.delete(file_path + 'tmp' + self.id.to_s + '.yml') #Delete yaml file
  end

end
