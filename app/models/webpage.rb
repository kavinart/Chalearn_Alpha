class Webpage < ActiveRecord::Base
  attr_accessible :title, :web_content, :url, :is_external_url
  belongs_to :challenge
  
  def webpage_yaml
  	return self.title.downcase.gsub(/\s+/,"_") + '.html' if self.is_external_url == false
  	return self.url
  end
end
