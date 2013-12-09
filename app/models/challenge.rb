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

end
