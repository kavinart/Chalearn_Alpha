class Webpage < ActiveRecord::Base
  attr_accessible :title, :web_content
  belongs_to :challenge
  
  def title_and_html_to_yaml
 	self.title + ': ' + self.title.downcase.gsub(/\s+/,"_") + '.html'
  end
  def title_html
  	self.title.downcase.gsub(/\s+/,"_") + '.html'
  end
  
end
